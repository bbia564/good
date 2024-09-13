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
    await db.insert('say', {
      'created_time': DateTime.now().subtract(Duration(days:1)).toIso8601String(),
      'type': 0,
      'words': 'Good morning! As the sun rises, new hopes and opportunities come with it. Let us face every challenge of today with a smile!'
    });
    await db.insert('say', {
      'created_time': DateTime.now().subtract(Duration(days:1)).toIso8601String(),
      'type': 0,
      'words': 'A new day, a new hope. Greet the morning with joy and gratitude! May you shine brightly today.'
    });
    await db.insert('say', {
      'created_time': DateTime.now().subtract(Duration(days:1)).toIso8601String(),
      'type': 0,
      'words': 'Good morning! From today on, take every step with firm faith, and the road to success is right under your feet.'
    });
    await db.insert('say', {
      'created_time': DateTime.now().subtract(Duration(days:1)).toIso8601String(),
      'type': 1,
      'words': "It's late at night, I hope you can put aside all your fatigue and worries and fall asleep peacefully. Good night, I wish you a good dream!"
    });
    await db.insert('say', {
      'created_time': DateTime.now().subtract(Duration(days:1)).toIso8601String(),
      'type': 1,
      'words': 'After a day of running around and working hard, close your eyes and feel the tranquility of the night. May you have a sweet dream, good night.'
    });
    await db.insert('say', {
      'created_time': DateTime.now().subtract(Duration(days:1)).toIso8601String(),
      'type': 1,
      'words': 'The stars are twinkling, the moonlight is soft, may your dreams tonight be as beautiful as the stars. Have a good rest, tomorrow will be a brand new day. Good night!'
    });
    await db.insert('say', {
      'created_time': DateTime.now().subtract(Duration(days:1)).toIso8601String(),
      'type': 2,
      'words': 'Dreams are the lighthouses that guide us forward. Even if the road is long, as long as we persist, we will see the dawn.'
    });
    await db.insert('say', {
      'created_time': DateTime.now().subtract(Duration(days:1)).toIso8601String(),
      'type': 2,
      'words': 'No matter how far away your dream is, as long as you take a small step every day, you will reach it one day.'
    });
    await db.insert('say', {
      'created_time': DateTime.now().subtract(Duration(days:1)).toIso8601String(),
      'type': 2,
      'words': 'Don’t be afraid of the thorns on the road to pursuing your dreams, because it is these challenges that make dreams more precious.'
    });
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
    print(result);
    return result.map((e) => SayEntity.fromJson(e)).toList();
  }
}
