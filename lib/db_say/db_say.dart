import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:good_say/db_say/say_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBSay extends GetxService {
  late Database dbBase;
  final faker = Faker();

  Future<DBSay> init() async {
    await createSayDB();
    return this;
  }

  createSayDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'say.db');
    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createSayTable(db);
          await _initData(db);
        });
  }

  createSayTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS say (id INTEGER PRIMARY KEY, created_time TEXT, type INTEGER, words TEXT)');
  }

  _initData(Database db) async {
    for (int i = 0; i < 50; i++) {
      await db.insert('say', {
        'created_time': DateTime.now().subtract(Duration(days: i+1)).toIso8601String(),
        'type': faker.randomGenerator.integer(3),
        'words': faker.lorem.sentence(),
      });
    }
  }

  deleteSay(SayEntity entity) async {
    await dbBase.delete('say', where: 'id = ?', whereArgs: [entity.id]);
  }

  updateSay(SayEntity entity) async {
    await dbBase.update('say', entity.toJson(),
        where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanAllData() async {
    await dbBase.delete('say');
  }

  Future<List<SayEntity>> getAllData() async {
    var result = await dbBase.query('say', orderBy: 'created_time DESC');
    return result.map((e) => SayEntity.fromJson(e)).toList();
  }
}
