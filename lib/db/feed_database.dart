import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'feed_class.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'mobile.db'),
      onCreate: (db, version) {
        return db
            .execute('CREATE TABLE feed(id INTEGER PRIMARY KEY, description TEXT)',);
      },
      version: 1,
    );
  }

  Future<void> insertText(FeedDescription text) async {
    Database _db = await database();
    await _db.insert('feed', text.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<FeedDescription>> getTexts() async {
    Database _db = await database();
    List<Map<String, dynamic>> _texts = await _db.query('feed');
    return List.generate(_texts.length, (index) {
      return FeedDescription(
          id: _texts[index]['id'], description: _texts[index]['description']);
    });
  }
}
