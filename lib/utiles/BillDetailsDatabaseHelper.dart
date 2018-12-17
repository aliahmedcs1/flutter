//import 'dart:async';
//import 'dart:convert';
//import 'dart:math';
//import 'package:flutter/material.dart';
//import 'package:flutter_app/model/Product.dart';
//import 'package:flutter_app/ui/ViewProduct.dart';
//import 'package:flutter_app/ui/ViewProduct.dart';
//import 'package:flutter_app/utiles/DatabaseHelper.dart';
//
////List bills;
//class ViewBill extends StatefulWidget {
//  //static var pdh=new ProductDatabaseHelper()
//
//  @override
//  ViewBillState createState() {
//    return new ViewBillState();
//  }
//}
//
////void setTable1(List l) async {
////  l= await pdh.getAllUsers();
////}
//class ViewBillState extends State<ViewBill> {
//  static List bills;
//  static var dh = new DatabaseHelper();
//
////  ViewBillState()
////
////  {
////    ali();
////  }
//
////   static var pdh=new ProductDatabaseHelper();
////   static Future<List>  products=pdh.getAllUsers();
////   static String value=products.toString();
////
////   Map valueMap = json.decode(value);
//
//  Widget bodyData() => DataTable(
//      onSelectAll: (b) {},
//      sortColumnIndex: 1,
//      sortAscending: true,
//      columns: <DataColumn>[
//        DataColumn(
//          label: Text("رقم"),
//          numeric: false,
//          onSort: (i, b) {
//            print("$i $b");
//            setState(() {
//              bills.sort((a, b) => a.name.compareTo(b.name));
//            });
//          },
//          tooltip: "To display first name of the Name",
//        ),
//        DataColumn(
//          label: Text("اسم"),
//          numeric: false,
//          onSort: (i, b) {
//            print("$i $b");
//            setState(() {
//              bills.sort((a, b) => a.parcode.compareTo(b.name));
//            });
//          },
//          tooltip: "To display last name of the Name",
//        ),
//        DataColumn(
//          label: Text("تاريخ"),
//          numeric: false,
//          onSort: (i, b) {
//            print("$i $b");
//            setState(() {
//              bills.sort((a, b) => a.parcode.compareTo(b.name));
//            });
//          },
//          tooltip: "To display last name of the Name",
//        ),
//        DataColumn(
//          label: Text("مسلسل"),
//          numeric: false,
//          onSort: (i, b) {
//            print("$i $b");
//            setState(() {
//              bills.sort((a, b) => a.parcode.compareTo(b.name));
//            });
//          },
//          tooltip: "To display last name of the Name",
//        ),
//        DataColumn(
//          label: Text("خصم"),
//          numeric: false,
//          onSort: (i, b) {
//            print("$i $b");
//            setState(() {
//              bills.sort((a, b) => a.parcode.compareTo(b.name));
//            });
//          },
//          tooltip: "To display last name of the Name",
//        ),
//        DataColumn(
//          label: Text("المدفوع"),
//          numeric: false,
//          onSort: (i, b) {
//            print("$i $b");
//            setState(() {
//              bills.sort((a, b) => a.parcode.compareTo(b.name));
//            });
//          },
//          tooltip: "To display last name of the Name",
//        ),
//        DataColumn(
//          label: Text("الاسم"),
//          numeric: false,
//          onSort: (i, b) {
//            print("$i $b");
//            setState(() {
//              bills.sort((a, b) => a.parcode.compareTo(b.name));
//            });
//          },
//          tooltip: "To display last name of the Name",
//        ),
//      ],
//      rows: bills
//          .map(
//            (name) => DataRow(
//          cells: [
//            DataCell(
//              Text(name['id'].toString()),
//              showEditIcon: false,
//              placeholder: false,
//            ),
//            DataCell(
//              Text(name['name']),
//              showEditIcon: false,
//              placeholder: false,
//            ),
//            DataCell(
//              Text(name['date'].toString()),
//              showEditIcon: false,
//              placeholder: false,
//            ),
//            DataCell(
//              Text(name['number'].toString()),
//              showEditIcon: false,
//              placeholder: false,
//            ),
//            DataCell(
//              Text(name['discount'].toString()),
//              showEditIcon: false,
//              placeholder: false,
//            ),
//            DataCell(
//              Text(name['paid'].toString()),
//              showEditIcon: false,
//              placeholder: false,
//            ),
//            DataCell(
//              Text(name['client_id'].toString()),
//              showEditIcon: false,
//              placeholder: false,
//            ),
//          ],
//        ),
//      )
//          .toList());
//
//  @override
//  Widget build(BuildContext context) {
//    ali();
//    // print(products[0]);
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Episode 5 - Data Table"),
//      ),
//      body: Container(
//        constraints: BoxConstraints.expand(),
//        child: bodyData(),
//      ),
//    );
//  }
//
//  void ali() async {
//    // var dh=new DatabaseHelper();
//    bills = await dh.getAllBills();
//    print(bills[0]);
//  }
//}
//
////class Name {
////  String firstName;
////  String lastName;
////
////  Name({this.firstName, this.lastName});
////}
////
////var names = <Name>[
////  Name(firstName: "Pawan", lastName: "Kumar"),
////  Name(firstName: "Aakash", lastName: "Tewari"),
////  Name(firstName: "Rohan", lastName: "Singh"),
////];
