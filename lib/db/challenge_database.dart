import 'package:challenge_tracker/db/challenge_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class ChallengeDatabase {
  static final instance = ChallengeDatabase._init();

  static late final Database? _database;


  ChallengeDatabase._init();

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initDB('challenge.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async{
    WidgetsFlutterBinding.ensureInitialized();
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);
    return await openDatabase(path, version: 1, onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE challenges(id INTEGER PRIMARY KEY, challenge_title TEXT)',
      );
    },);
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }



  // Define a function that inserts challenges into the database
  Future<void> insertChallenge(Challenge challenge) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the challenge into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same challenge is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'challenges',
      challenge.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Challenge>?> challenges() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The challenges.
    final List<Map<String, dynamic>> maps = await db.query('challenges');
    if(maps.length == 0) {
      return null;
    }
    else {
      // Convert the List<Map<String, dynamic> into a List<challenge>.
      return List.generate(maps.length, (i) {
        return Challenge(
          id: maps[i]['id'],
          challengeTitle: maps[i]['challengeTitle'],
        );
      });
    }

  }

  Future<void> updateChallenge(Challenge challenge) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Challenge.
    await db.update(
      'challenges',
      challenge.toMap(),
      // Ensure that the Challenge has a matching id.
      where: 'id = ?',
      // Pass the Challenge's id as a whereArg to prevent SQL injection.
      whereArgs: [challenge.id],
    );
  }

  Future<void> deleteChallenge(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Challenge from the database.
    await db.delete(
      'challenges',
      // Use a `where` clause to delete a specific Challenge.
      where: 'id = ?',
      // Pass the Challenge's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<Challenge> readNote(int id) async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT challengeTitle FROM challenges where id = ${id}');

    if (maps.isNotEmpty) {
      return Challenge(id: id, challengeTitle: maps[0]['challengeTitle']);
    } else {
      throw Exception('ID $id not found');
    }
  }


}
