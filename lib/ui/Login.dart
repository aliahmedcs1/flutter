import 'package:flutter/material.dart';
import 'package:flutter_app/model/HurrySell.dart';
import 'package:flutter_app/ui/InsertBill.dart';
import 'package:flutter_app/ui/InsertClient.dart';
import 'package:flutter_app/ui/InsertHurrySell.dart';
import 'package:flutter_app/ui/InsertProduct.dart';
import 'package:flutter_app/ui/InsertSafe.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_app/ui/InsertSepakaProduct.dart';
import 'package:flutter_app/ui/ProfitView.dart';
import 'package:flutter_app/ui/SearchClient.dart';
import 'package:flutter_app/ui/ViewBillDetails.dart';
import 'package:flutter_app/ui/ViewSafe.dart';
import 'package:flutter_app/utiles/DatabaseHelper.dart';
import 'package:flutter_app/utiles/MyApp.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_app/ui/Test.dart';
import 'package:flutter_app/ui/ViewBill.dart';
import 'package:flutter_app/ui/ViewClient.dart';
import 'package:flutter_app/ui/ViewProduct.dart';

//import 'package:flutter_app/ui/ViewProductFinal.dart';
TextEditingController code = new TextEditingController();
double left_01;
double width_20;
double width_99;
double font_1;

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  //final dateFormat = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
  final dateFormat = DateFormat("yyyy-mm-dd hh:mm:ss");
//  static TextEditingController _date1Controller = new TextEditingController();
//  static TextEditingController _profitController = new TextEditingController();
//  static TextEditingController _date2Controller = new TextEditingController();
  String _welcomeString = "";
  String barcode;
  DatabaseHelper dh = new DatabaseHelper();
  static BuildContext context1;
  @override
  Widget build(BuildContext context) {
    context1 = context;
    double width = MediaQuery.of(context).size.width;
    width_99 = width * 0.99;
    width_20 = width * 0.22;
    left_01 = width * 0.01;
    font_1 = width * 0.028;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("الرئيسية"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        color: Colors.black26,
        constraints: BoxConstraints.expand(),
        // BoxFit.fitHeight,
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            //image/profile
//            new Image.asset(
//              'images/face.png',
//              width: 90.0,
//              height: 90.0,
//              color: Colors.lightGreen,
//            ),

            //form
//            new Container(
//              width: width_99,
            // color: Colors.black26,
            // margin: const EdgeInsets.only(left: 30.0),
//              child: new RaisedButton(
//                  onPressed: barcodeScanning,
//                  color: Colors.green,
//                  child: new Text("اقرأ",
//                      style:
//                          new TextStyle(color: Colors.white, fontSize: 16.9))),
//            ),
//            new TextField(
//              controller: code,
//              decoration: new InputDecoration(
//                  hintText: 'ProductPrice', icon: new Icon(Icons.person)),
//            ),
            new Container(
//              height: 380.0,
//              width: 380.0,
              //  color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new Text(
                      'كهرباء',
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                      textAlign: TextAlign.center,
                    ),
//                    height: 50.0,
                    width: width_99,
                    color: Colors.black26,
                  ),
                  new Center(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Login button
                        new Container(
                          width: width_20,
                          // height: height_20,
                          color: Colors.green,
                          margin: EdgeInsets.only(left: left_01),
                          child: new RaisedButton(
//                            onPressed: (){dh.writeCounter();
//                            },
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InsertProduct()),
                                );

                                // print("WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW"+b.toString());
                              },
                              child: new Text("منتج كهربى",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: font_1)),
                              color: Colors.redAccent),
                        ),

                        // Clear button
                        new Container(
                          width: width_20,
                          color: Colors.orange,
                          margin: EdgeInsets.only(left: left_01),
                          child: new RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InsertBill()),
                                );
                              },
                              color: Colors.green,
                              child: new Text("فاتورة",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 16.9))),
                        ),

                        new Container(
                          width: width_20,
                          margin: EdgeInsets.only(left: left_01),
                          color: Colors.blue,
                          child: new RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfitView()),
                                );
                              },
                              color: Colors.blue,
                              child: new Text("مكسب",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: font_1))),
                        ),
                      ],
                    ),
                  ),
                  new Center(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Clear button
                        new Container(
                          width: width_20,
                          color: Colors.green,
                          margin: EdgeInsets.only(left: left_01),
                          child: new RaisedButton(
                              color: Colors.green,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewSafe()),
                                );
                              },
                              //  color: Colors.green,
                              child: new Text("بحث عميل",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: font_1))),
                        ),
                        new Container(
                          width: width_20,
                          margin: EdgeInsets.only(left: left_01),
                          color: Colors.green,
                          child: new RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InsertClient()),
                                );
                              },
                              color: Colors.green,
                              child: new Text("عميل",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 16.9))),
                        ),                      ],
                    ),
                  ),
                  new Container(
                    child: new Text(
                      'سباكه',
                      style: TextStyle(color: Colors.white, fontSize: 36.0),
                      textAlign: TextAlign.center,
                    ),
                    //                   height: 50.0,
                    width: width_99,
                    color: Colors.black26,
                  ),
                  new Center(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          width: width_20,
                          color: Colors.orange,
                          margin: EdgeInsets.only(left: left_01),
                          child: new RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InsertSepakaProduct()),
                                );
                              },
                              color: Colors.redAccent,
                              child: new Text("منتج سباكة",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: font_1))),
                        ),

                        // Clear button
                        new Container(
                          width: width_20,
                          color: Colors.orange,
                          margin: EdgeInsets.only(left: left_01),
                          child: new RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ProfitView()),
                                );
                              },
                              color: Colors.green,
                              child: new Text("تقرير",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 16.9))),
                        ),

                        new Container(
                          width: width_20,
                          color: Colors.orange,
                          margin: EdgeInsets.only(left: left_01),
                          child: new RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>InsertHurrySell()),
                                );
                              },
                              color: Colors.redAccent,
                              child: new Text("بيع سريع",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 16.9))),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: new Text(
                      'خزينه',
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                      textAlign: TextAlign.center,
                    ),
                    //                   height: 50.0,
                    width: width_99,
                    color: Colors.black26,
                  ),
                  new Center(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          width: width_20,
                          color: Colors.orange,
                          margin: EdgeInsets.only(left: left_01),
                          child: new RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InsertSafe()),
                                );
                              },
                              color: Colors.green,
                              child: new Text("ادخال ايصال",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: font_1))),
                        ),

                        // Clear button
                        new Container(
                          width: width_20,
                          color: Colors.orange,
                          margin: EdgeInsets.only(left: left_01),
                          child: new RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewProduct()),
                                );
                              },
                              color: Colors.green,
                              child: new Text("تقرير",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 16.9))),
                        ),
                        new Container(
                          width: width_20,
                          color: Colors.green,
                          margin: EdgeInsets.only(left: left_01),
                          child: new RaisedButton(
                              onPressed: () {
                                dh.writeCounter();
                                print(
                                    "WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
                                showToast("تم بنجاح");
                              },
                              //                         onPressed: () async {
//                                Navigator.push(
//                                  context,
//                                  MaterialPageRoute(builder: (context) => InsertProduct()),
//                                );

                              //                             },
                              child: new Text("نسخه احتياطيه",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: font_1)),
                              color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), //form ends here

            new Padding(padding: const EdgeInsets.all(14.0)),

            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Welcome, $_welcomeString",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future barcodeScanning() async {
//imageSelectorGallery();

    try {
      String barcode = await BarcodeScanner.scan();
      print("AAAAAAAAAAAAAAAAAAAAAAAAAAAA$barcode");
      setState(() => code.text = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          code.text = 'No camera permission!';
        });
      } else {
        setState(() => code.text = 'Unknown error: $e');
      }
    } on FormatException catch (e) {
      print(e);
      setState(() => code.text = 'Nothing captured.$e');
    } catch (e) {
      setState(() => code.text = 'Unknown error: $e');
    }
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        bgcolor: "#e74c3c",
        textcolor: '#ffffff');
  }

//  void showDialog1() {
//    showDialog(
//      context: context1,
//      builder: (BuildContext context) {
//        // return object of type Dialog
//        return AlertDialog(
//          title: new Text("Alert Dialog title"),
//          content: new Container(
//            width: 50.0,
//            child: new Column(
//              children: <Widget>[
//                new TextField(
//                  enabled: false,
//                  controller: _profitController,
//                  decoration: new InputDecoration(
//                      hintText: 'الربح', icon: new Icon(Icons.person)),
//                ),
////
//              ],
//            ),
//          ),
//          actions: <Widget>[
//            // usually buttons at the bottom of the dialog
//            new FlatButton(
//              child: new Text("اغلاق"),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }
}
