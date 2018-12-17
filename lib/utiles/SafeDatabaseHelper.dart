////import 'dart:async';
//import 'dart:convert';
//import 'dart:math';
//import 'package:flutter/material.dart';
//import 'package:flutter_app/model/Bill.dart';
//import 'package:flutter_app/model/BillDetails.dart';
//import 'package:flutter_app/model/Product.dart';
//import 'package:flutter_app/ui/InsertBillDetails.dart';
//import 'package:flutter_app/ui/ViewProduct.dart';
//import 'package:flutter_app/ui/ViewProduct.dart';
//import 'package:flutter_app/utiles/DatabaseHelper.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:path/path.dart';
//
//
//
//class ViewBillDetails extends StatefulWidget {
//  //static var pdh=new ProductDatabaseHelper()
////  static List billsDetails;
////  ViewBillDetails(){
////    ali();
////  }
//
//
//  @override
//  ViewBillDetailsState createState() {
//
//
//    return new ViewBillDetailsState();
//  }
////  void ali( ) async {
////    var dh = new DatabaseHelper();
////    billsDetails = await dh.getMaxBillDetails();
////    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"+billsDetails[0]);
////  }
//
//}
////void setTable1(List l) async {
////  l= await pdh.getAllUsers();
////}
//class ViewBillDetailsState extends State<ViewBillDetails> {
//  static List billsDetails;
//  static BuildContext context1;
//  static String val;
//  TextEditingController _massController = new TextEditingController();
//  TextEditingController _moneyController = new TextEditingController();
//  static TextEditingController _costController = new TextEditingController();
//  var dh = new DatabaseHelper();
//
//
//  // ViewBillDetailsState()
//
////  {
////    ali();
////  }
//  @override
//  void initState() {
//
//    ali();
//  }
////   static var pdh=new ProductDatabaseHelper();
////   static Future<List>  products=pdh.getAllUsers();
////   static String value=products.toString();
////
////   Map valueMap = json.decode(value);
//
//  Widget bodyData( ) =>
//      DataTable(
//
//          onSelectAll: ( b ) {},
//          sortColumnIndex: 1,
//          sortAscending: true,
//          columns: <DataColumn>[
//            DataColumn(
//              label: Text("رقم"),
//              numeric: false,
//              onSort: ( i, b ) {
//                print("$i $b");
//                setState(( ) {
//                  billsDetails.sort(( a, b ) => a.name.compareTo(b.name));
//                });
//              },
//              tooltip: "To display first name of the Name",
//            ),
//            DataColumn(
//              label: Text("باركود"),
//              numeric: false,
//              onSort: ( i, b ) {
//                print("$i $b");
//                setState(( ) {
//                  billsDetails.sort(( a, b ) => a.parcode.compareTo(b.name));
//                });
//              },
//              tooltip: "To display last name of the Name",
//            ),
//            DataColumn(
//              label: Text("باركود"),
//              numeric: false,
//              onSort: ( i, b ) {
//                print("$i $b");
//                setState(( ) {
//                  billsDetails.sort(( a, b ) => a.parcode.compareTo(b.name));
//                });
//              },
//              tooltip: "To display last name of the Name",
//            ),
//            DataColumn(
//              label: Text("رقم الفاتورة"),
//              numeric: false,
//              onSort: ( i, b ) {
//                print("$i $b");
//                setState(( ) {
//                  billsDetails.sort(( a, b ) => a.parcode.compareTo(b.name));
//                });
//              },
//              tooltip: "To display last name of the Name",
//            ),
//
//          ],
//
//          rows: billsDetails.map(
//
//                ( name ) =>
//                DataRow(
//                  selected: true,
//                  //onSelectChanged: DataRow.byIndex(cells: null),
//                  cells: [
//                    DataCell(
//                        Text(name['id'].toString()),
//                        showEditIcon: false,
//                        placeholder: false,
//                        onTap: ( ) {
//                          _massController.text = name['mass'].toString();
//                          showDialog(
//                            context: context1,
//                            builder: ( BuildContext context ) {
//                              // return object of type Dialog
//                              return AlertDialog(
//                                title: new Text("Alert Dialog title"),
//                                content: new Container(
//                                  width: 50.0,
//
//                                  child: new Column(
//                                    children: <Widget>[
//                                      new TextField(
//
//                                        controller: _massController,
//                                        decoration: new InputDecoration(
//                                            hintText: 'الكمية',
//                                            icon: new Icon(Icons.person)
//                                        ),
//                                      ),
////                                new TextField(
////                                  controller: _barcodeController,
////                                  decoration: new InputDecoration(
////                                      hintText: 'بحث',
////                                      icon: new Icon(Icons.person)
////                                  ),
////                                ),
//                                    ],
//                                  ),
//                                ),
//                                actions: <Widget>[
//
//
//                                  // usually buttons at the bottom of the dialog
//                                  new FlatButton(
//                                    child: new Text("اغلاق"),
//                                    onPressed: ( ) {
//                                      Navigator.of(context).pop();
//                                    },
//                                  ),
//                                  new FlatButton(
//                                    child: new Text("تحديث"),
//                                    onPressed: ( ) {
//                                      // getBillDetailsFunc(int.parse(_idBill.text));
//                                      BillDetails billDetails = new BillDetails
//                                          .foo(name['id'],
//                                          double.parse(_massController.text),
//                                          name['barcode'], name['bill_id']);
//                                      updateBillDetails(billDetails);
//                                      Navigator.of(context).pop();
//                                      Navigator.push(
//                                        context,
//                                        MaterialPageRoute(
//                                            builder: ( context ) =>
//                                                ViewBillDetails()),
//                                      );
//                                      showToast("تم بنجاح");
//                                    },
//                                  ),
//                                ],
//
//                              );
//                            },
//                          );
//                        }
//                    ),
//                    DataCell(
//                      Text(name['mass'].toString()),
//                      showEditIcon: false,
//                      placeholder: false,
//                    ),
//                    DataCell(
//                      Text(name['barcode'].toString()),
//                      showEditIcon: false,
//                      placeholder: false,
//                    ),
//                    DataCell(
//                      Text(name['bill_id'].toString()),
//                      showEditIcon: false,
//                      placeholder: false,
//                    ),
//
//                  ],
//                ),
//          ).toList()
//      );
//
//  @override
//  Widget build( BuildContext context ) {
//
//    //  ali();
//    context1 = context;
//    // print(products[0]);
//    return Scaffold(
//      appBar: AppBar(
//          title: Text("Episode 5 - Data Table"),
//          actions: <Widget>[
//            new IconButton(
//              icon: new Icon(Icons.payment),
//              tooltip: 'Action Tool Tip',
//              onPressed: ( ) async {
//                Bill bill = await dh.getBill(await dh.getMaxBillId());
//                _moneyController.text = bill.money.toString();
//                int s=await dh.getTotalPrice();
//                val= "$s";
//                _costController.text=val;
//                showDialog(
//                  context: context1,
//                  builder: ( BuildContext context ) {
//                    // return object of type Dialog
//                    return AlertDialog(
//                      title: new Text("Alert Dialog title"),
//                      content: new Container(
//                        width: 50.0,
//
//                        child: new Column(
//                          children: <Widget>[
//                            new TextField(
//
//                              controller: _moneyController,
//                              decoration: new InputDecoration(
//                                  hintText: 'المبلغ المدفوع',
//                                  icon: new Icon(Icons.person)
//                              ),
//                            ),
//                            new TextField(
//                              controller: _costController,
//                              decoration: new InputDecoration(
//                                  hintText: 'التكلفة',
//                                  icon: new Icon(Icons.person)
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                      actions: <Widget>[
//
//
//                        // usually buttons at the bottom of the dialog
//                        new FlatButton(
//                          child: new Text("اغلاق"),
//                          onPressed: ( ) {
//                            Navigator.of(context).pop();
//                          },
//                        ),
//                        new FlatButton(
//                          child: new Text("تحديث"),
//                          onPressed: ( ) {
//                            // getBillDetailsFunc(int.parse(_idBill.text));
//                            Bill bill1 = new Bill.foo(
//                                bill.id,
//                                bill.name,
//                                bill.date,
//                                bill.number,
//                                bill.discount,
//                                bill.paid,
//                                bill.client_id,
//                                double.parse(_moneyController.text),
//                                bill.type);
//                            updateBill(bill1);
//                            Navigator.of(context).pop();
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: ( context ) => ViewBillDetails()),
//                            );
//                            if(bill!=null){
//                              showToast("تم جلب البيانات");
//                            }else{
//                              showToast("ابحث مره ثانيه");
//                            }
//                          },
//                        ),
//                      ],
//
//                    );
//                  },
//                );
//              },
//            ),
//          ]
//      ),
////      body: Container(
////        child: bodyData(),
////      ),
//      body: Container(
//        child: new FutureBuilder(
//            future: ali(),
//            builder: (BuildContext context, AsyncSnapshot snapshot) {
//              return new Container(
//                child: bodyData(),
//              );
//            }),
//      ),
//
//    );
//  }
//
//
//  ali( ) async {
//    //var dh = new DatabaseHelper();
//    billsDetails = await dh.getMaxBillDetails();
//    print(billsDetails[0]);
//  }
//
//  void updateBillDetails( BillDetails billDetails ) async {
//    //var pdh=new DatabaseHelper();
//    int back = await dh.updateBillDetails(billDetails);
//  }
//
//  void updateBill( Bill bill ) async {
//    //var pdh=new DatabaseHelper();
//    int back = await dh.updateBill(bill);
//  }
//
//  void showToast(String msg) {
//    Fluttertoast.showToast(
//        msg: msg,
//        toastLength: Toast.LENGTH_LONG,
//        gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
//        bgcolor: "#e74c3c",
//        textcolor: '#ffffff'
//    );
//  }
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
//}