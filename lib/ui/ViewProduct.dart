import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/Product.dart';
import 'package:flutter_app/ui/ViewProduct.dart';
import 'package:flutter_app/ui/ViewProduct.dart';
import 'package:flutter_app/utiles/DatabaseHelper.dart';

List products;

class ViewProduct extends StatefulWidget {
  //static var pdh=new ProductDatabaseHelper()

  @override
  ViewProductState createState() {
    return new ViewProductState();
  }
}

//void setTable1(List l) async {
//  l= await pdh.getAllUsers();
//}
class ViewProductState extends State<ViewProduct> {
  // static List products;
  ViewProductState() {
    ali();
  }
//   static var pdh=new ProductDatabaseHelper();
//   static Future<List>  products=pdh.getAllUsers();
//   static String value=products.toString();
//
//   Map valueMap = json.decode(value);

  Widget bodyData() => DataTable(
      onSelectAll: (b) {},
      sortColumnIndex: 1,
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(
          label: Text(
            "رقم",
            textAlign: TextAlign.center,
          ),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              products.sort((a, b) => a.parcode.compareTo(b.name));
            });
          },
          tooltip: "To display last name of the Name",
        ),
        DataColumn(
          label: Text(
            "الاسم",
            textAlign: TextAlign.center,
          ),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              products.sort((a, b) => a.name.compareTo(b.name));
            });
          },
          tooltip: "To display first name of the Name",
        ),
        DataColumn(
          label: Text(
            "باركود",
            textAlign: TextAlign.center,
          ),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              products.sort((a, b) => a.barcode.compareTo(b.name));
            });
          },
          tooltip: "To display last name of the Name",
        ),
        DataColumn(
          label: Text(
            "السعر",
            textAlign: TextAlign.center,
          ),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              products.sort((a, b) => a.parcode.compareTo(b.name));
            });
          },
          tooltip: "To display last name of the Name",
        ),
        DataColumn(
          label: Text(
            "الكمية",
            textAlign: TextAlign.center,
          ),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              products.sort((a, b) => a.parcode.compareTo(b.name));
            });
          },
          tooltip: "To display last name of the Name",
        ),
        DataColumn(
          label: Text(
            "الفعلية",
            textAlign: TextAlign.center,
          ),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              products.sort((a, b) => a.parcode.compareTo(b.name));
            });
          },
          tooltip: "To display last name of the Name",
        ),
        DataColumn(
          label: Text(
            "سعر الشراء",
            textAlign: TextAlign.center,
          ),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              products.sort((a, b) => a.parcode.compareTo(b.name));
            });
          },
          tooltip: "To display last name of the Name",
        ),
        DataColumn(
          label: Text(
            "سعر البيع",
            textAlign: TextAlign.center,
          ),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              products.sort((a, b) => a.parcode.compareTo(b.name));
            });
          },
          tooltip: "To display last name of the Name",
        ),
        DataColumn(
          label: Text(
            "النوع",
            textAlign: TextAlign.center,
          ),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              products.sort((a, b) => a.parcode.compareTo(b.name));
            });
          },
          tooltip: "To display last name of the Name",
        ),
      ],
      rows: products
          .map(
            (name) => DataRow(
                  cells: [
                    DataCell(
                      Text(
                        name['id'].toString(),
                        textAlign: TextAlign.center,
                      ),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(
                        name['name'],
                        textAlign: TextAlign.center,
                      ),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(
                        name['barcode'].toString(),
                        textAlign: TextAlign.center,
                      ),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(
                        name['price'].toString(),
                        textAlign: TextAlign.center,
                      ),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(
                        name['mass'].toString(),
                        textAlign: TextAlign.center,
                      ),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(
                        name['massFound'].toString(),
                        textAlign: TextAlign.center,
                      ),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(
                        name['buyPrice'].toString(),
                        textAlign: TextAlign.center,
                      ),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(
                        name['sellPrice'].toString(),
                        textAlign: TextAlign.center,
                      ),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(
                        name['type'].toString(),
                        textAlign: TextAlign.center,
                      ),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                  ],
                ),
          )
          .toList());

  @override
  Widget build(BuildContext context) {
    // print(products[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Episode 5 - Data Table"),
      ),
      body: Container(
        child: bodyData(),
      ),
    );
  }

  void ali() async {
    var pdh = new DatabaseHelper();
    products = await pdh.getAllProducts();
    print(products[0]);
  }
}

//class Name {
//  String firstName;
//  String lastName;
//
//  Name({this.firstName, this.lastName});
//}
//
//var names = <Name>[
//  Name(firstName: "Pawan", lastName: "Kumar"),
//  Name(firstName: "Aakash", lastName: "Tewari"),
//  Name(firstName: "Rohan", lastName: "Singh"),
//];
