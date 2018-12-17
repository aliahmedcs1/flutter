import 'package:flutter/material.dart';
//import 'package:flutter_app/model/BillDetails.dart';
import 'package:flutter_app/model/HurrySell.dart';
//import 'package:flutter_app/model/Product.dart';
import 'package:flutter_app/utiles/DatabaseHelper.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InsertHurrySell extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new InsertHurrySellState();
  }
}

class InsertHurrySellState extends State<InsertHurrySell> {
  double left_01;
  double width_22;
  double width_99;
   TextEditingController _massController = new TextEditingController();
  TextEditingController _barcodeController = new TextEditingController();

  //TextEditingController _billIdController = new TextEditingController();
  var dh = new DatabaseHelper();

//  static BillDetails oneBillDetails;
//  final TextEditingController _idBill = new TextEditingController();
  String _welcomeString = "";

  void _erase() {
    setState(() {
      //_dateController.clear();
      _barcodeController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    try{
    double width = MediaQuery.of(context).size.width;
    width_99 = width * 0.99;
    width_22 = width * 0.22;
    left_01 = width * 0.01;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("البيع السريع"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
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

            new Container(
              width: width_22,
              margin: EdgeInsets.only(left: left_01),
              child: new RaisedButton(
                  onPressed: barcodeScanning,
                  color: Colors.redAccent,
                  child: new Text("اقرا",
                      style:
                          new TextStyle(color: Colors.white, fontSize: 16.9))),
            ),

            //form
            new Container(
//              height: 600.0,
//              width: 380.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    keyboardType: TextInputType.number,
                    controller: _barcodeController,
                    decoration: new InputDecoration(
                      hintText: 'باركود',
                      icon: new Icon(Icons.lock),
                    ),
                    // obscureText: true,
                  ),

                  new TextField(
                    keyboardType: TextInputType.number,
                    controller: _massController,
                    decoration: new InputDecoration(
                      hintText: 'الكمية',
                      icon: new Icon(Icons.lock),
                    ),
                    // obscureText: true,
                  ),
                  new Padding(padding: new EdgeInsets.all(10.5)), //add padding
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        // Login button
                        new Container(
                          width: width_22,
                          margin: EdgeInsets.only(left: left_01),
                          child: new RaisedButton(
                              onPressed: () {
                                createHurry();
                                showToast("تم بنجاح");
                              },
                              color: Colors.redAccent,
                              child: new Text("ادخال",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 16.9))),
                        ),

                        // Clear button
                        new Container(
                          width: width_22,
                          margin: EdgeInsets.only(left: left_01),
                          child: new RaisedButton(
                              onPressed: _erase,
                              color: Colors.redAccent,
                              child: new Text("Clear",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 16.9))),
                        ),
                      ],
                    ),
                  )
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
  }catch(e){
  showToast("ادخل كل الحقول كما هو موضح فيها");
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

  void createHurry() {
    var pro = new HurrySell(_barcodeController.text, DateTime.now().toString(),int.parse(_massController.text));

    dh.saveHurry(pro);
  }

//  void updateBillDetails(BillDetails billDetails) async {
//    //var pdh=new DatabaseHelper();
//    int back= await dh.updateBillDetails(billDetails);
//
//  }
//
//  void getBillDetailsFunc(int id) async {
//    //var pdh=new DatabaseHelper();
//    oneBillDetails= await dh.getBillDetails(id);
//    // return getBill;
//  }
//  void _showWelcome() {
//    setState((){
//      if (_userController.text.isNotEmpty
//          && _passwordController.text.isNotEmpty) {
//
//        _welcomeString = _userController.text;
//
//      }else
//        _welcomeString = "Nothing!";
//
//    });
  Future barcodeScanning() async {
//imageSelectorGallery();

    try {
      String barcode = await BarcodeScanner.scan();
      print("AAAAAAAAAAAAAAAAAAAAAAAAAAAA$barcode");
      setState(() => _barcodeController.text = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          _barcodeController.text = 'اعطى الكاميرا تصريح';
        });
      } else {
        setState(() => _barcodeController.text = '');
      }
    } on FormatException catch (e) {
      print(e);
      setState(() => _barcodeController.text = '');
    } catch (e) {
      setState(() => _barcodeController.text = '');
    }
  }
}
