import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'models/text.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'mobile.db'),
      onCreate: (db, version) {
        return db
            .execute('CREATE TABLE texts (id INTEGER PRIMARY KEY, text TEXT,)');
      },
      version: 1,
    );
  }

  Future<void> insertText(Texts text) async {
    Database _db = await database();
    await _db.insert('texts', text.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Texts>> getTexts() async {
    Database _db = await database();
    List<Map<String, dynamic>> _texts = await _db.query('texts');
    return List.generate(_texts.length, (index) {
      return Texts(id: _texts[index]['id'], text: _texts[index]['text']);
    });
  }
}
