import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/Bill.dart';
import 'package:flutter_app/model/BillDetails.dart';
import 'package:flutter_app/model/Product.dart';
import 'package:flutter_app/ui/ViewBillDetails.dart';
import 'package:flutter_app/utiles/DatabaseHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class InsertBillDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new InsertBillDetailsState();
  }
}

class InsertBillDetailsState extends State<InsertBillDetails> {
  double left_01;
  double width_22;
  double width_99;
  TextEditingController _massController = new TextEditingController();
  TextEditingController _barcodeController = new TextEditingController();
  TextEditingController _billIdController = new TextEditingController();
  var dh = new DatabaseHelper();
  static BillDetails oneBillDetails;
  final TextEditingController _idBill = new TextEditingController();
  String _welcomeString = "";

  void _erase() {
    setState(() {
      _massController.clear();
      _barcodeController.clear();
      _billIdController.clear();
    });

    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Alert Dialog title"),
            content: new Text("Alert Dialog body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    width_99 = width * 0.99;
    width_22 = width * 0.22;
    left_01 = width * 0.01;
    try{
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("تفاصيل الفاتورة"),
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

//            new TextField(
//              controller: _idBill,
//              decoration: new InputDecoration(
//                  hintText: 'بحث', icon: new Icon(Icons.person)),
//            ),
//            new Container(
//              width: width_22,
//              margin: EdgeInsets.only(left: left_01),
//              child: new RaisedButton(
//                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => ViewBillDetails()),
//                    );
////                    oneBillDetails = dh.getBillDetails(int.parse(_idBill.text))
////                        as BillDetails;
////                    _massController.text = oneBillDetails.mass.toString();
////                    _barcodeController.text = oneBillDetails.barcode;
////                    // _billIdController = billDetails.bill_id as TextEditingController;
////                    if (oneBillDetails != null) {
////                      showToast("تم جلب البيانات");
////                    } else {
////                      showToast("ابحث مره ثانيه");
////                    }
//                  },
//                  color: Colors.redAccent,
//                  child: new Text("بحث",
//                      style:
//                          new TextStyle(color: Colors.white, fontSize: 16.9))),
//            ),

            //form
            new Container(
//              height: 600.0,
//              width: 380.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _barcodeController,
                    decoration: new InputDecoration(
                        hintText: 'باركود', icon: new Icon(Icons.person)),
                    keyboardType: TextInputType.number,
                  ),
                  new Container(
                    width: width_22,
                    margin: EdgeInsets.only(left: left_01),
                    child: new RaisedButton(
                        onPressed: barcodeScanning,
                        color: Colors.redAccent,
                        child: new Text("بحث",
                            style: new TextStyle(
                                color: Colors.white, fontSize: 16.9))),
                  ),
                  new TextField(
                    controller: _massController,
                    decoration: new InputDecoration(
                      hintText: 'الكمية',
                      icon: new Icon(Icons.lock),
                    ),
                    // obscureText: true,
                    keyboardType: TextInputType.number,
                  ),
//                  new TextField(
//                    controller: _billIdController,
//                    decoration: new InputDecoration(
//                        hintText: 'رقم الفاتورة',
//                        icon: new Icon(Icons.person)
//                    ),
//                  ),

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
                                createBillDetails();
                                showToast("تم بنجاح");
                              },
                              color: Colors.redAccent,
                              child: new Text("ادخال",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 16.9))),
                        ),
//                        new Container(
//                          width: width_22,
//                          margin: EdgeInsets.only(left: left_01),
//                          child: new RaisedButton(
//                              onPressed: () {
//                                getBillDetailsFunc(int.parse(_idBill.text));
//                                BillDetails billDetails = new BillDetails.foo(
//                                    int.parse(_idBill.text),
//                                    double.parse(_massController.text),
//                                    _barcodeController.text,
//                                    int.parse(_billIdController.text));
//                                updateBillDetails(billDetails);
//                                showToast("تم بنجاح");
//                              },
//                              color: Colors.redAccent,
//                              child: new Text("تحديث",
//                                  style: new TextStyle(
//                                      color: Colors.white, fontSize: 16.9))),
//                        ),
                        // Clear button
                        new Container(
                          width: width_22,
                          margin: EdgeInsets.only(left: left_01),
                          child: new RaisedButton(
                              // onPressed: _erase,
                              onPressed: () {
//                                await new Future.delayed(
//                                    const Duration(seconds: 3));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewBillDetails()),
                                );
                              },
                              color: Colors.redAccent,
                              child: new Text("تفاصيل",
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

  Future createBillDetails() async {
    var pro = new BillDetails(double.parse(_massController.text),
        _barcodeController.text, await dh.getMaxBillId());

    dh.saveBillDetails(pro);
    Product product = await dh.getProduct(_barcodeController.text);
    Bill bill = await dh.getBill(await dh.getMaxBillId());
    if (bill.type == "شراء") {
      product.mass = product.mass + int.parse(_massController.text);
     // product.massFound = product.massFound + int.parse(_massController.text);
    } else {
      product.mass = product.mass - int.parse(_massController.text);
     // product.massFound = product.massFound + int.parse(_massController.text);
    }

    dh.updateProductMass(product);
  }

  void updateBillDetails(BillDetails billDetails) async {
    //var pdh=new DatabaseHelper();
    int back = await dh.updateBillDetails(billDetails);
  }

  void getBillDetailsFunc(int id) async {
    //var pdh=new DatabaseHelper();
    oneBillDetails = await dh.getBillDetails(id) ;
    // return getBill;
  }

  Future barcodeScanning() async {
//imageSelectorGallery();

    try {
      String barcode = await BarcodeScanner.scan();
      print("AAAAAAAAAAAAAAAAAAAAAAAAAAAA$barcode");
      setState(() => _barcodeController.text = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          _barcodeController.text = 'اعطى الكاميرا تصريح!';
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

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        bgcolor: "#e74c3c",
        textcolor: '#ffffff');
  }
}
