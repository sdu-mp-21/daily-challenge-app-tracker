import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'feed_class.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'mobile.db'),
      onCreate: (db, version) {
        return db
            .execute('CREATE TABLE feed(id INTEGER PRIMARY KEY, description TEXT, time TEXT)',);
      },
      version: 1,
    );
  }

  Future<int> insertText(FeedDescription text) async {
    int _feedId = 0;
    Database _db = await database();
    await _db.insert('feed', text.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace).then((value) {
        _feedId = value;
    });
    return _feedId;
  }

  Future<void> updateFeed(int id, String description) async{
    Database _db = await database();
    await _db.rawUpdate("UPDATE feed SET description = '$description' WHERE id = '$id' ");
  }

  Future<void> deleteFeed(int id) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM feed WHERE id = '$id' ");
  }

  Future<List<FeedDescription>> getTexts() async {
    Database _db = await database();
    List<Map<String, dynamic>> _texts = await _db.query('feed');
    return List.generate(_texts.length, (index) {
      return FeedDescription(
          id: _texts[index]['id'], description: _texts[index]['description']);
    }).reversed.toList();
  }
}
