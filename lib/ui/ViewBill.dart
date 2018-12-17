import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/Bill.dart';
import 'package:flutter_app/model/BillDetails.dart';
import 'package:flutter_app/model/Product.dart';
import 'package:flutter_app/ui/ViewBillDetails.dart';
import 'package:flutter_app/ui/ViewProduct.dart';
import 'package:flutter_app/ui/ViewProduct.dart';
import 'package:flutter_app/utiles/DatabaseHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';
//List bills;
class ViewBill extends StatefulWidget {
  //static var pdh=new ProductDatabaseHelper()
  int billId;
  ViewBill.fo(this.billId) {
    ViewBillState.bill_id = billId;
  }
  ViewBill() {}
  @override
  ViewBillState createState() {
    return new ViewBillState();
  }
}

//void setTable1(List l) async {
//  l= await pdh.getAllUsers();
//}
class ViewBillState extends State<ViewBill> {
  static List bills;
  static var dh = new DatabaseHelper();
  static BuildContext context1;
  static List billsDetails;
static int bill_id;
  //static List billsDetails;
  static String val;
  TextEditingController _massController = new TextEditingController();
  TextEditingController _moneyController = new TextEditingController();
  static TextEditingController _costController = new TextEditingController();

//  ViewBillState()
//
//  {
//    ali();
//  }

//   static var pdh=new ProductDatabaseHelper();
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
              label: Text("رقم"),
              numeric: false,
              onSort: ( i, b ) {
                print("$i $b");
                setState(( ) {
                  bills.sort(( a, b ) => a.name.compareTo(b.name));
                });
              },
              tooltip: "To display first name of the Name",
            ),
            DataColumn(
              label: Text("اسم"),
              numeric: false,
              onSort: ( i, b ) {
                print("$i $b");
                setState(( ) {
                  bills.sort(( a, b ) => a.parcode.compareTo(b.name));
                });
              },
              tooltip: "To display last name of the Name",
            ),
            DataColumn(
              label: Text("تاريخ"),
              numeric: false,
              onSort: ( i, b ) {
                print("$i $b");
                setState(( ) {
                  bills.sort(( a, b ) => a.parcode.compareTo(b.name));
                });
              },
              tooltip: "To display last name of the Name",
            ),
            DataColumn(
              label: Text("مسلسل"),
              numeric: false,
              onSort: ( i, b ) {
                print("$i $b");
                setState(( ) {
                  bills.sort(( a, b ) => a.parcode.compareTo(b.name));
                });
              },
              tooltip: "To display last name of the Name",
            ),
            DataColumn(
              label: Text("خصم"),
              numeric: false,
              onSort: ( i, b ) {
                print("$i $b");
                setState(( ) {
                  bills.sort(( a, b ) => a.parcode.compareTo(b.name));
                });
              },
              tooltip: "To display last name of the Name",
            ),
            DataColumn(
              label: Text("المدفوع"),
              numeric: false,
              onSort: ( i, b ) {
                print("$i $b");
                setState(( ) {
                  bills.sort(( a, b ) => a.parcode.compareTo(b.name));
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
                  bills.sort(( a, b ) => a.parcode.compareTo(b.name));
                });
              },
              tooltip: "To display last name of the Name",
            ),
          ],
          rows: bills
              .map(
                ( name ) =>
                DataRow(
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
                    DataCell(
                      Text(name['date'].toString()),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(name['number'].toString()),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(name['discount'].toString()),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(name['paid'].toString()),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(name['client_id'].toString()),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                  ],
                ),
          )
              .toList());


  Widget bodyData2() =>
      DataTable(
          onSelectAll: ( b ) {},
          sortColumnIndex: 1,
          sortAscending: true,
          columns: <DataColumn>[
            DataColumn(
              label: Text("رقم"),
              numeric: false,
              onSort: ( i, b ) {
                print("$i $b");
                setState(( ) {
                  billsDetails.sort(( a, b ) => a.name.compareTo(b.name));
                });
              },
              tooltip: "To display first name of the Name",
            ),
            DataColumn(
              label: Text("الكمية"),
              numeric: false,
              onSort: ( i, b ) {
                print("$i $b");
                setState(( ) {
                  billsDetails.sort(( a, b ) => a.parcode.compareTo(b.name));
                });
              },
              tooltip: "To display last name of the Name",
            ),
            DataColumn(
              label: Text("باركود"),
              numeric: false,
              onSort: ( i, b ) {
                print("$i $b");
                setState(( ) {
                  billsDetails.sort(( a, b ) => a.parcode.compareTo(b.name));
                });
              },
              tooltip: "To display last name of the Name",
            ),
//            DataColumn(
//              label: Text("الاسم"),
//              numeric: false,
//              onSort: ( i, b ) {
//                print("$i $b");
//                setState(( ) {
//                  billsDetails.sort(( a, b ) => a.parcode.compareTo(b.name));
//                });
//              },
//              tooltip: "To display last name of the Name",
//            ),
            DataColumn(
              label: Text("رقم الفاتورة"),
              numeric: false,
              onSort: ( i, b ) {
                print("$i $b");
                setState(( ) {
                  billsDetails.sort(( a, b ) => a.parcode.compareTo(b.name));
                });
              },
              tooltip: "To display last name of the Name",
            ),
          ],
          rows: billsDetails
              .map(
                ( name ) =>
                DataRow(
                  selected: true,
                  //onSelectChanged: DataRow.byIndex(cells: null),
                  cells: [
                    DataCell(
                      Text(name['id'].toString()),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(name['mass'].toString()),
                      showEditIcon: false,
                      placeholder: false,
                      onTap: ( ) {
                        _massController.text = name['mass'].toString();
                        showDialog(
                          context: context1,
                          builder: ( BuildContext context ) {
                            // return object of type Dialog
                            return AlertDialog(
                              title: new Text("Alert Dialog title"),
                              content: new Container(
                                width: 50.0,
                                child: new Column(
                                  children: <Widget>[
                                    new TextField(
                                      controller: _massController,
                                      decoration: new InputDecoration(
                                          hintText: 'الكمية',
                                          icon: new Icon(Icons.person)),
                                    ),
//                                new TextField(
//                                  controller: _barcodeController,
//                                  decoration: new InputDecoration(
//                                      hintText: 'بحث',
//                                      icon: new Icon(Icons.person)
//                                  ),
//                                ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                // usually buttons at the bottom of the dialog
                                new FlatButton(
                                  child: new Text("اغلاق"),
                                  onPressed: ( ) {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                new FlatButton(
                                  child: new Text("تحديث"),
                                  onPressed: ( ) {
                                    // getBillDetailsFunc(int.parse(_idBill.text));
                                    BillDetails billDetails =
                                    new BillDetails.foo(
                                        name['id'],
                                        double.parse(_massController.text),
                                        name['barcode'],
                                        name['bill_id']);
                                    updateBillDetails(billDetails);
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ( context ) =>
                                              ViewBillDetails()),
                                    );
                                    showToast("تم بنجاح");
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    DataCell(
                      Text(name['barcode'].toString()),
                      showEditIcon: false,
                      placeholder: false,
                    ),
//                    DataCell(
//                      Text(name['name']),
//                      showEditIcon: false,
//                      placeholder: false,
//                    ),
                    DataCell(
                      Text(name['bill_id'].toString()),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                  ],
                ),
          )
              .toList());

  @override
  Widget build( BuildContext context ) {
    context1 = context;
    return new FutureBuilder(
        future: ali(),
        builder: ( BuildContext context, AsyncSnapshot snapshot ) {
          return Scaffold(
            appBar: AppBar(
              title: Text
                ("Episode 5 - Data Table"),
            ),
            body:
            Container(
              constraints: BoxConstraints.expand(),
              child:new Column(
              children: <Widget>[
               bodyData(),
               new Padding(padding: const EdgeInsets.all(14.0)),
               bodyData2()
            ],
              ),
            ),
          );
        }
    );
  }

  ali() async {
    bills = await dh.getBillAsList(bill_id);

    print(bills[0]);
    // var dh=new DatabaseHelper();
    billsDetails = await dh.getBillDetailsAsList(bill_id);
    print("WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW"+billsDetails[0]);


  }

//  ali2( ) async {
//    //var dh = new DatabaseHelper();
//    billsDetails = await dh.getMaxBillDetails();
//    print(billsDetails[0]);
//  }

  void updateBillDetails( BillDetails billDetails ) async {
    //var pdh=new DatabaseHelper();
    int back = await dh.updateBillDetails(billDetails);
  }

  void updateBill( Bill bill ) async {
    //var pdh=new DatabaseHelper();
    int back = await dh.updateBill(bill);
  }

  void showToast( String msg ) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        bgcolor: "#e74c3c",
        textcolor: '#ffffff');
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
