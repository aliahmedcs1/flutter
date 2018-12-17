import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/Product.dart';
import 'package:flutter_app/ui/ViewProduct.dart';
import 'package:flutter_app/ui/ViewProduct.dart';
import 'package:flutter_app/utiles/ClientDatabaseHelper.dart';
import 'package:flutter_app/utiles/DatabaseHelper.dart';



class ViewClient extends StatefulWidget {
  //static var pdh=new ProductDatabaseHelper()

  @override
  ViewClientState createState() {
    return new ViewClientState();
  }
}

//void setTable1(List l) async {
//  l= await pdh.getAllUsers();
//}
class ViewClientState extends State<ViewClient> {
   static List clients;
  ViewClientState() {
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
          label: Text("الرقم"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              clients.sort((a, b) => a.name.compareTo(b.name));
            });
          },
          tooltip: "To display first name of the Name",
        ),
        DataColumn(
          label: Text("الاسم"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              clients.sort((a, b) => a.parcode.compareTo(b.name));
            });
          },
          tooltip: "To display last name of the Name",
        ),
      ],
      rows: clients
          .map(
            (name) => DataRow(
                  cells: [
                    DataCell(
                      Text(name['id'].toString()),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(name['name']),
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
    clients = await pdh.getAllClients();
    print(clients[0]);
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
