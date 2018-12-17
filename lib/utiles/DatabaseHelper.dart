import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/model/Bill.dart';
import 'package:flutter_app/model/BillDetails.dart';
import 'package:flutter_app/model/Client.dart';
import 'package:flutter_app/model/HurrySell.dart';
import 'package:flutter_app/model/Product.dart';
import 'package:flutter_app/model/Safe.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:flutter/services.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  final String tableSafe = "Safe";
  final String tableBillDetails = "BillDetails";
  final String tableClient = "Client";
  final String tableBill = "BILLTABLE";
  final String tableProduct = "ProductTable";
  final String columnId = "id";
  final String columnBarcode = "barcode";
  final String columnPrice = "price";
  final String columnMass = "mass";
  final String columnMassFound = "massFound";
  final String columnBuyPrice = "buyPrice";
  final String columnSellPrice = "sellPrice";
  final String columnType = "type";
  final String columnName = "name";
  static String path;
  static String path1;
  //static Database _db;
  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    path = join(
        documentDirectory.path, "maindb.db"); //home://directory/files/maindb.db
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA$path");
    var ourDb = await openDatabase(path,
        version: 1, onCreate: _onCreate, readOnly: false);
    return ourDb;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tableProduct($columnId INTEGER PRIMARY KEY,$columnName TEXT, "
        "$columnBarcode TEXT,$columnPrice Double,$columnMass NUMBER(8),"
        "$columnMassFound NUMBER(8),$columnBuyPrice DOUBLE,$columnSellPrice DOUBLE,"
        "$columnType TEXT )");
    await db.execute(
        "CREATE TABLE Client(id INTEGER PRIMARY KEY,name TEXT UNIQUE)");
    await db.execute("CREATE TABLE BILLTABLE(id INTEGER PRIMARY KEY,name TEXT, "
        "number NUMBER(8),date TEXT,discount Double,"
        "paid Boolean,client_id INTEGER NOT NULL,money Double,type TEXT,FOREIGN KEY (client_id) REFERENCES Client (id) ON DELETE NO ACTION ON UPDATE NO ACTION)");
    await db.execute(
        "CREATE TABLE BillDetails(id INTEGER PRIMARY KEY,barcode TEXT,mass Double,bill_id INTEGER NOT NULL,FOREIGN "
        "KEY (bill_id) REFERENCES BILLTABLE (id) ON DELETE NO ACTION ON UPDATE NO ACTION )");
    await db.execute("CREATE TABLE Safe(id INTEGER PRIMARY KEY,"
        "money Double,client_id INTEGER NOT NULL,type TEXT,creditorType Text,FOREIGN KEY (client_id) REFERENCES Client (id) ON DELETE NO ACTION ON UPDATE NO ACTION )");
    await db.execute(
        "CREATE TABLE HURRYSELL(id INTEGER PRIMARY KEY,barcode TEXT,date TEXT,mass INTEGER)");
  }

  //CRUD - CREATE, READ, UPDATE , DELETE

//  Insertion
  Future<int> saveProduct(Product user) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableProduct", user.toMap());
    return res;
  }

  //Get Users
  Future<List> getAllProducts() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableProduct");

    return result.toList();
  }

  Future<int> getCountProducts() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableProduct"));
  }

  Future<Product> getProduct(String barcode) async {
    var dbClient = await db;

    var result = await dbClient.rawQuery(
        "SELECT * FROM $tableProduct WHERE $columnBarcode = $barcode");
    if (result.length == 0) return null;
    return new Product.fromMap(result.first);
  }

  Future<Product> getProductById(int id) async {
    var dbClient = await db;

    var result = await dbClient
        .rawQuery("SELECT * FROM $tableProduct WHERE $columnId = $id");
    if (result.length == 0) return null;
    return new Product.fromMap(result.first);
  }

  Future<int> deleteProduct(int id) async {
    var dbClient = await db;

    return await dbClient
        .delete(tableProduct, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> updateProduct(Product product) async {
    var dbClient = await db;
    return await dbClient.update(tableProduct, product.toMap(),
        where: "$columnId = ?", whereArgs: [product.id]);
  }

  Future<int> updateProductMass(Product product) async {
    var dbClient = await db;
    return await dbClient.update(tableProduct, product.toMap(),
        where: "$columnBarcode = ?", whereArgs: [product.barcode]);
  }

  Future<int> getTotalSell(String date1,String date2) async{

      var dbClient = await db;
      return Sqflite.firstIntValue(
          await dbClient.rawQuery("SELECT IFNULL(CAST((sum($tableProduct.sellPrice*$tableBillDetails.mass)) AS INT),0) "
              "FROM $tableProduct,$tableBill,$tableBillDetails "
              "where $tableBillDetails.barcode=$tableProduct.barcode and $tableBill.date "
              "between \'$date1\' and \'$date2\'"));

  }
  Future<int> getTotalBuy(String date1,String date2) async{
    print("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBbetween \'$date1\' and \'$date2\'");
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT IFNULL(CAST((sum($tableProduct.buyPrice*$tableBillDetails.mass)) AS INT),0) "
            "FROM $tableProduct,$tableBill,$tableBillDetails "
            "where $tableBillDetails.barcode=$tableProduct.barcode and $tableBill.date "
            "between \'$date1\' and \'$date2\'"));
    print("between \'$date1\' and \'$date2\'");

  }
  Future<int> getHurryTotalSell(String date1,String date2) async{

    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT IFNULL(CAST((sum($tableProduct.sellPrice*HurrySell.mass)) AS INT),0) "
            "FROM $tableProduct,HurrySell "
            "where HurrySell.barcode=$tableProduct.barcode and HurrySell.date "
            "between \'$date1\' and \'$date2\'"));

  }

  //////////////////////
  ///////Bill//////////

  Future<int> saveBill(Bill bill) async {
    var dbClient = await db;
    int res = await dbClient.insert("BILLTABLE", bill.toMapBill());
    return res;
  }

  Future<List> getAllBills() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableBill");

    return result.toList();
  }

  Future<int> getCountBills() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableBill"));
  }

  Future<int> getMaxBillId() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT max(id) FROM $tableBill"));
  }

  Future<Bill> getBill(int id) async {
    var dbClient = await db;

    var result = await dbClient
        .rawQuery("SELECT * FROM $tableBill WHERE $columnId = $id");
    if (result.length == 0) return null;
    return new Bill.fromMapBill(result.first);
  }
  Future<List> getBillAsList(int id) async {
    var dbClient = await db;

    var result = await dbClient
        .rawQuery("SELECT * FROM $tableBill WHERE $columnId = $id");
    if (result.length == 0) return null;
    return result.toList();
  }

  Future<int> deleteBill(int id) async {
    var dbClient = await db;

    return await dbClient
        .delete(tableBill, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> updateBill(Bill bill) async {
    var dbClient = await db;
    return await dbClient.update(tableBill, bill.toMapBill(),
        where: "$columnId = ?", whereArgs: [bill.id]);
  }

  //////////////////////////
  ///////////client//////////

  Future<int> saveClient(Client client) async {
    var dbClient = await db;
    int res = await dbClient.insert("Client", client.toMap());
    return res;
  }

  Future<List> getAllClients() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableClient");

    return result.toList();
  }

  Future<int> getCountClients() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableClient"));
  }

  Future<Client> getClient(String name) async {
    var dbClient = await db;

    var result = await dbClient.rawQuery(
        "SELECT * FROM $tableClient WHERE $columnName like '%$name%'");
    if (result.length == 0) return null;
    return new Client.fromMap(result.first);
  }
  Future<Client> getClientById(int id) async {
    var dbClient = await db;
  var result = await dbClient.rawQuery(
  "SELECT * FROM $tableClient WHERE $columnId =$id");
  if (result.length == 0) return null;
  return new Client.fromMap(result.first);
}

  Future<int> deleteClient(int id) async {
    var dbClient = await db;

    return await dbClient
        .delete(tableClient, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> updateClient(Client client) async {
    var dbClient = await db;
    return await dbClient.update(tableClient, client.toMap(),
        where: "$columnId = ?", whereArgs: [client.id]);
  }

  //////////////////////////////////
  ///////////BillDetails///////////

  Future<int> saveBillDetails(BillDetails billDetails) async {
    var dbClient = await db;
    int res = await dbClient.insert("BillDetails", billDetails.toMap());
    return res;
  }

  Future<List> getAllBillsDetails() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableBillDetails");

    return result.toList();
  }

  Future<List> getMaxBillDetails() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM $tableBillDetails where id=(select max(id) from $tableBillDetails)");

    return result.toList();
  }

  Future<int> getTotalPrice(String type) async {
    var dbClient = await db;
    if(type=="شراء")
    return Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT CAST((sum(buyPrice*$tableBillDetails.mass))AS INT) FROM $tableBillDetails , $tableProduct"
        " where $tableBillDetails.barcode=$tableProduct.barcode AND $tableBillDetails.id="
        "(select max(BillDetails.id) from BillDetails)"));
    else
      return Sqflite.firstIntValue(await dbClient.rawQuery(
          "SELECT CAST((sum(sellPrice*$tableBillDetails.mass))AS INT) FROM $tableBillDetails , $tableProduct"
              " where $tableBillDetails.barcode=$tableProduct.barcode AND $tableBillDetails.id="
              "(select max(BillDetails.id) from BillDetails)"));
  }



  Future<int> getCountBillsDetails() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableBillDetails"));
  }

  Future<BillDetails> getBillDetails(int id) async {
    var dbClient = await db;

    var result = await dbClient
        .rawQuery("SELECT * FROM $tableBillDetails WHERE bill_id = $id");
    if (result.length == 0) return null;
    return new BillDetails.fromMap(result.first);;
  }
  Future<List> getBillDetailsAsList(int id) async {
    var dbClient = await db;

    var result = await dbClient
        .rawQuery("SELECT * FROM $tableBillDetails WHERE bill_id = $id");
    if (result.length == 0) return null;
    return result.toList();
  }
  Future<int> deleteBillDetails(int id) async {
    var dbClient = await db;

    return await dbClient
        .delete(tableBillDetails, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> updateBillDetails(BillDetails billDetails) async {
    var dbClient = await db;
    return await dbClient.update(tableBillDetails, billDetails.toMap(),
        where: "$columnId = ?", whereArgs: [billDetails.id]);
  }

//  Future<List> getBillDetailsAsList(int id) async {
//    var dbClient = await db;
//
//    var result = await dbClient
//        .rawQuery("SELECT * FROM $tableBillDetails WHERE $columnId = $id");
//    if (result.length == 0) return null;
//    return result.toList();
//  }
  ////////////////////////////////
  ///////////safe////////////////

  Future<int> saveSafe(Safe safe) async {
    var dbClient = await db;
    int res = await dbClient.insert("Safe", safe.toMap());
    return res;
  }

  Future<List> getAllSafes() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableSafe");

    return result.toList();
  }

  Future<List> getPersonSafes(int clientId) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableSafe where client_id=$clientId");

    return result.toList();
  }

  Future<int> getCountSafe() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableSafe"));
  }

  Future<int> getImportsSafe(int id) async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT CAST(sum(money) AS INT) FROM $tableSafe where client_id=$id and type='وارد'"));
  }

  Future<int> getExportsSafe(int id) async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT CAST(sum(money) AS INT) FROM $tableSafe where client_id=$id and type='صرف'"));
  }
  Future<Safe> getSafe(int id) async {
    var dbClient = await db;

    var result = await dbClient
        .rawQuery("SELECT * FROM $tableSafe WHERE $columnId = $id");
    if (result.length == 0) return null;
    return new Safe.fromMap(result.first);
  }

  Future<int> deleteSafe(int id) async {
    var dbClient = await db;

    return await dbClient
        .delete(tableSafe, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> updateSafe(Safe safe) async {
    var dbClient = await db;
    return await dbClient.update(tableSafe, safe.toMap(),
        where: "$columnId = ?", whereArgs: [safe.id]);
  }

////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////HURRYSELL/////////////////////////////////////////

  Future<int> saveHurry(HurrySell hurry) async {
    var dbClient = await db;
    int res = await dbClient.insert("HURRYSELL", hurry.toMap());
    return res;
  }

  Future<List> getAllHurries() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM HURRYSELL");

    return result.toList();
  }

/////////////////////////////////read file///////////////////////////////////////////////////

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path1 = await _localPath;
    return File('$path1/maindb.db');
  }

  Future<String> remoteFile() async {
    Directory extDir = await getExternalStorageDirectory();
    path1 = extDir.toString().trim() + '/sdcard';
    return path1;
  }

  Future<File> writeCounter() async {
    final file = await _localFile;

    _checkPermissions();
    remoteFile();
    print("PPPPPPPPPPPPPPPPPPPPPPPPPPPP$path1");
    return file.copy("/storage/emulated/0/ali.db");

    //  });
  }

  bool externalStoragePermissionOkay = false;

  _checkPermissions() async {
    if (Platform.isAndroid) {
      SimplePermissions
          .checkPermission(Permission.WriteExternalStorage)
          .then((checkOkay) {
        if (!checkOkay) {
          SimplePermissions
              .requestPermission(Permission.WriteExternalStorage)
              .then((okDone) {
            if (okDone) {
              debugPrint("${okDone}");
              // setState(() {
              externalStoragePermissionOkay = okDone;
              debugPrint('Refresh UI');
              //  });
            }
          });
        } else {
          // setState(() {
          externalStoragePermissionOkay = checkOkay;
          //  });
        }
      });
    }
  }
  // String path1 =

///////////////////////////////////////////////////////////////////////////////////////////////////
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
