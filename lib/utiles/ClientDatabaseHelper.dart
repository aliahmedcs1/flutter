//import 'dart:async';
//import 'dart:io';
//
//import 'package:flutter_app/model/Client.dart';
//
//import 'package:path/path.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:sqflite/sqflite.dart';
//
//class ClientDatabaseHelper {
//  static final ClientDatabaseHelper _instance = new ClientDatabaseHelper.internal();
//
//  factory ClientDatabaseHelper() => _instance;
//
//  final String tableClient = "ClientTable";
//  final String columnId = "id";
//  final String columnName = "name";
//
//  static Database _db;
//
//  Future<Database> get db async {
//    if (_db != null) {
//      return _db;
//    }
//    _db = await initDb();
//
//    return _db;
//  }
//
//  ClientDatabaseHelper.internal();
//
//  initDb() async {
//    Directory documentDirectory = await getApplicationDocumentsDirectory();
//    String path = join(
//        documentDirectory.path, "maindb.db"); //home://directory/files/maindb.db
//
//    var ourDb = await openDatabase(path,onCreate: _onCreate, version: 1);
//    return ourDb;
//  }
//
//  /*
//     id | username | password
//     ------------------------
//     1  | Paulo    | paulo
//     2  | James    | bond
//   */
//
//  void _onCreate(Database db, int newVersion) async {
//    await db.execute(
//        "CREATE TABLE $tableClient($columnId INTEGER PRIMARY KEY AUTOINCREMENT,$columnName TEXT,)");
//  }
//
//  //CRUD - CREATE, READ, UPDATE , DELETE
//
//  //Insertion
//  Future<int> saveClient(Client client) async {
//    var dbClient = await db;
//    int res = await dbClient.insert("$tableClient", client.toMap());
//    return res;
//  }
//
//  //Get Users
//  Future<List> getAllUsers() async {
//    var dbClient = await db;
//    var result = await dbClient.rawQuery("SELECT * FROM $tableClient");
//
//    return result.toList();
//  }
//
//  Future<int> getCount() async {
//    var dbClient = await db;
//    return Sqflite.firstIntValue(
//        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableClient"));
//  }
//
//  Future<Client> getUser(int id) async {
//    var dbClient = await db;
//
//    var result = await dbClient.rawQuery("SELECT * FROM $tableClient WHERE $columnId = $id");
//    if (result.length == 0) return null;
//    return new Client.fromMap(result.first);
//  }
//
//  Future<int> deleteUser(int id) async {
//    var dbClient = await db;
//
//    return await dbClient.delete(tableClient,
//        where: "$columnId = ?", whereArgs: [id]);
//  }
//
//
//  Future<int> updateUser(Client client) async {
//    var dbClient = await db;
//    return await dbClient.update(tableClient,
//        client.toMap(), where: "$columnId = ?", whereArgs: [client.id]);
//  }
//
//  Future close() async {
//    var dbClient = await db;
//    return dbClient.close();
//  }
//
//
//}