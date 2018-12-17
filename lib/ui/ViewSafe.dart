import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/Client.dart';
import 'package:flutter_app/model/Product.dart';
import 'package:flutter_app/ui/ViewProduct.dart';
import 'package:flutter_app/ui/ViewProduct.dart';
import 'package:flutter_app/utiles/DatabaseHelper.dart';
import 'package:kernel/transformations/closure/context.dart';

List safes;

class ViewSafe extends StatefulWidget {
  //static var pdh=new ProductDatabaseHelper()
  int idOne;
  ViewSafe.fo(this.idOne) {
    ViewSafeState.clientId = idOne;
  }
  ViewSafe();
  @override
  ViewSafeState createState() {
    return new ViewSafeState();
  }
}

//void setTable1(List l) async {
//  l= await pdh.getAllUsers();
//}
class ViewSafeState extends State<ViewSafe> {
  // static List products;
  var dh = new DatabaseHelper();
  static String clientName;
  static int clientId;
  BuildContext context1;
//  ViewSafeState( ) {
//    ali();
//  }

  static TextEditingController _importController = new TextEditingController();
  static TextEditingController _exportController = new TextEditingController();
//   static Future<List>  products=pdh.getAllUsers();
//   static String value=products.toString();
//
//   Map valueMap = json.decode(value);

  Widget bodyData( ) =>
      DataTable(
          onSelectAll: ( b ) {},
          sortColumnIndex: 1,
          sortAscending: true,
          columns: <DataColumn>[
            DataColumn(
              label: Text("الرقم"),
              numeric: false,
              onSort: ( i, b ) {
                print("$i $b");
                setState(( ) {
                  safes.sort(( a, b ) => a.name.compareTo(b.name));
                });
              },
              tooltip: "To display first name of the Name",
            ),
            DataColumn(
              label: Text("المبلغ"),
              numeric: false,
              onSort: ( i, b ) {
                print("$i $b");
                setState(( ) {
                  safes.sort(( a, b ) => a.parcode.compareTo(b.name));
                });
              },
              tooltip: "To display last name of the Name",
            ),
            DataColumn(
              label: Text("النوع"),
              numeric: false,
              onSort: ( i, b ) {
                print("$i $b");
                setState(( ) {
                  safes.sort(( a, b ) => a.parcode.compareTo(b.name));
                });
              },
              tooltip: "To display last name of the Name",
            ),
            DataColumn(
              label: Text("الاسم"),
              numeric: false,
              onSort: ( i, b ) {
                print("$i $b");
                setState(( ) {
                  safes.sort(( a, b ) => a.parcode.compareTo(b.name));
                });
              },
              tooltip: "To display last name of the Name",
            ),
            DataColumn(
              label: Text("الحاله"),
              numeric: false,
              onSort: ( i, b ) {
                print("$i $b");
                setState(( ) {
                  safes.sort(( a, b ) => a.parcode.compareTo(b.name));
                });
              },
              tooltip: "To display last name of the Name",
            ),
          ],
          rows: safes
              .map(
                ( name ) =>
                DataRow(
                  cells: [
                    DataCell(
                      Text(name['id'].toString()),
                      showEditIcon: false,
                      placeholder: false,
                    ),
//                    DataCell(
//                      Text(name['name']),
//                      showEditIcon: false,
//                      placeholder: false,
//                    ),
                    DataCell(
                      Text(name['money'].toString()),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(name['type'].toString()),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(name['client_id'].toString()),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(name['creditorType'].toString()),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                  ],
                ),
          )
              .toList());

  @override
  Widget build( BuildContext context ) {
    // print(products[0]);
   return new FutureBuilder(
        future: ali(),
        builder: (context, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar:
            AppBar(title: Text("جدول وصلات عميل"), actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.payment),
                tooltip: 'Action Tool Tip',
                onPressed: () async {
//                  Bill bill = await dh.getBill(await dh.getMaxBillId());
//                  _importController.text = bill.money.toString();
//                  int s = await dh.getTotalPrice(bill.type);
//                  val = "$s";
                int i= await dh.getImportsSafe(clientId);
                int e= await dh.getExportsSafe(clientId);
                int difference=i-e;
//                  _costController.text = val;
                  _importController.text="$i";
                  _exportController.text="$e";
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // return object of type Dialog

                      return AlertDialog(
                        title: new Text("Alert Dialog title"),
                        content: new Container(
                          width: 50.0,
                          child: new Column(
                            children: <Widget>[
                              new TextField(
                                enabled: false,
                                controller: _importController,
                                decoration: new InputDecoration(
                                    hintText: 'الواردات',
                                    labelText:"الواردات" ,
                                    icon: new Icon(Icons.person)),
                                keyboardType: TextInputType.number,
                              ),
                              new TextField(
                                enabled: false,
                                controller: _exportController,
                                decoration: new InputDecoration(
                                    hintText: 'الصادرات',
                                    labelText:"الصادرات" ,
                                    icon: new Icon(Icons.person)),
                                keyboardType: TextInputType.number,
                              ),
                              new Text("$difference الفرق بينهم "),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          new FlatButton(
                            child: new Text("اغلاق"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),

                        ],
                      );
                    },
                  );
                },
              ),
            ]),
//      appBar: AppBar(
//        title: Text("الايصالات"),
//      ),
      body: Container(
        child: bodyData(),
      ),
    );
  }
    );
  }

  ali()async {
    //var dh = new DatabaseHelper();
    safes = await dh.getPersonSafes(clientId);

    print(safes[0]);
  }
//  String getName( int id ) {
//    Future<Client> client = dh.getClientById(id);
//
//    // print("YYYYYYYYYYYYYYYYYYYYYYYYYY${client.name}");
//     clientName=client.substring(0,client.name.length-1);
//    return client.name.toString();
//  }

//  String getNameFinal( ) {
//    String a= getName(id);
//    return a;
//  }

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
  }