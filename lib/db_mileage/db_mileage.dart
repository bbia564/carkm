import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mileage_records/db_mileage/mileage_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBMileage extends GetxService {
  late Database dbBase;

  Future<DBMileage> init() async {
    await createMileageDB();
    return this;
  }

  Future<Uint8List> loadImageBytes(String imagePath) async {
    ByteData data = await rootBundle.load(imagePath);
    Uint8List bytes = data.buffer.asUint8List();
    return bytes;
  }

  createMileageDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'mileage.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createMileageTable(db);
          await createTrafficTable(db);
        });
  }

  createMileageTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS mileage (id INTEGER PRIMARY KEY, createTime TEXT, startLocation TEXT, endLocation TEXT, mileage INTEGER, traffic TEXT, content TEXT)');
  }

  createTrafficTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS traffic (id INTEGER PRIMARY KEY, createTime TEXT, name TEXT, image BLOB)');
  }

  insertMileage(MileageEntity entity) async {
    final id = await dbBase.insert('mileage', {
      'createTime': entity.createTime.toIso8601String(),
      'startLocation': entity.startLocation,
      'endLocation': entity.endLocation,
      'mileage': entity.mileage,
      'traffic': jsonEncode(entity.traffic.toJson()),
      'content': entity.content,
    });
    return id;
  }

  insertTraffic(TrafficEntity entity) async {
    final id = await dbBase.insert('traffic', {
      'createTime': entity.createTime.toIso8601String(),
      'name': entity.name,
      'image': entity.image,
    });
    return id;
  }

  deleteMileage(MileageEntity entity) async {
    await dbBase.delete('mileage', where: 'id = ?', whereArgs: [entity.id]);
  }

  deleteTraffic(TrafficEntity entity) async {
    await dbBase.delete('traffic', where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanAllData() async {
    await dbBase.delete('mileage');
    await dbBase.delete('traffic');
  }

  Future<List<MileageEntity>> getMileageAllData() async {
    var result = await dbBase.query('mileage', orderBy: 'createTime DESC');
    return result.map((e) => MileageEntity.fromJson(e)).toList();
  }

  Future<List<TrafficEntity>> getTrafficAllData() async {
    var result = await dbBase.query('traffic', orderBy: 'createTime DESC');
    return result.map((e) => TrafficEntity.fromJson(e)).toList();
  }
}
