import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/Bill.dart';
import 'package:flutter_app/model/Client.dart';
import 'package:flutter_app/ui/InsertBillDetails.dart';
import 'package:flutter_app/ui/SearchClient.dart';
import 'package:flutter_app/ui/SearchClientBill.dart';
import 'package:flutter_app/ui/ViewBill.dart';
import 'package:flutter_app/utiles/BillDatabaseHelper.dart';
import 'package:flutter_app/utiles/DatabaseHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InsertBill extends StatefulWidget {
  String nameOne;
  InsertBill.fo(this.nameOne) {
    InsertBillState._nameController.text = nameOne;
  }
 // InsertBill() {}
  //static String nametwo=InsertBillState.nameController.text;
  int todo;
  InsertBill({Key key, @required this.todo}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new InsertBillState();
  }
}

class InsertBillState extends State<InsertBill> {
  double left_01;
  double width_22;
  double width_99;

//  SearchClient searchName;
//  InsertBillState({Key key, @required this.searchName});
  static int   _radioValue1;
  static int   _radioValue2;
  static TextEditingController _nameController = new TextEditingController();
  TextEditingController _numberController = new TextEditingController();
  TextEditingController _discountController = new TextEditingController();
  //static TextEditingController _paidController = new TextEditingController();
  //TextEditingController _moneyController = new TextEditingController();
  //static TextEditingController _typeController = new TextEditingController();
  final TextEditingController _idBill = new TextEditingController();
  static var dh = new DatabaseHelper();
  static Bill oneBill;
  String _welcomeString = "";
  static String  _result ;
  static String  _resultPaid ;
  String todo;
  static Client client;
  void _erase() {
    setState(() {
      _nameController.clear();
      _numberController.clear();
      //_moneyController.clear();
      _discountController.clear();
      //_paidController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    width_99 = width * 0.99;
    width_22 = width * 0.22;
    left_01 = width * 0.01;
try {
  return new Scaffold(
    appBar: new AppBar(
      title: new Text("ادخال فاتورة"),
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

          //form
          new Container(
//              height: 600.0,
//              width: 380.0,
            color: Colors.white,
            child: new Column(
              children: <Widget>[
//                  new Container(
                //                 child: new Row(
//
                //                 children:<Widget>[
                new TextField(
                  controller: _idBill,
                  decoration: new InputDecoration(
                      hintText: 'بحث', icon: new Icon(Icons.person)),
                  keyboardType: TextInputType.number,
                ),
                new Container(
                  width: width_22,
                  margin: EdgeInsets.only(left: left_01),
                  child: new RaisedButton(
                      onPressed: ( ) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ( context ) =>
                                  ViewBill.fo(int.parse(_idBill.text))),
                        );
//                          getBillFunc(int.parse(_idBill.text));
//                          // print("PPPPPPPPPPP${oneBill[0]}");
//                          //Bill bill= dh.getBill(int.parse(_idBill.text)) as Bill;
//                          _nameController.text = oneBill.name;
//                          _numberController.text = oneBill.number.toString();
//                         // _moneyController.text = oneBill.money.toString();
//                          _discountController.text =
//                              oneBill.discount.toString();
//                          _resultPaid = oneBill.paid.toString();
//                          if (oneBill != null) {
//                            showToast("تم جلب البيانات");
//                          } else {
//                            showToast("ابحث مره ثانيه");
//                          }
                      },
//
//
//
                      color: Colors.redAccent,
                      child: new Text("بحث",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 16.9))),

                ),
                //   ],
                //       ),
                //       ),
                new TextField(
                  enabled: false,
                  controller: _nameController,
                  decoration: new InputDecoration(
                      hintText: 'الاسم', icon: new Icon(Icons.person)),
                  // onChanged:_showWelcome(),
                ),
                new Container(
                  width: width_22,
                  margin: EdgeInsets.only(left: left_01),
                  child: new RaisedButton(
                      onPressed: ( ) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ( context ) => SearchClientBill()),
                        );
                        getClientId();
                      },
                      color: Colors.redAccent,
                      child: new Text("الاسم",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 16.9))),
                ),
                new TextField(
                  controller: _numberController,
                  decoration: new InputDecoration(
                    hintText: 'الرقم',
                    icon: new Icon(Icons.lock),
                  ),
                  keyboardType: TextInputType.number,
                  // obscureText: true,
                ),

//                  new TextField(
//                    controller: _discountController,
//                    decoration: new InputDecoration(
//                        hintText: 'الخصم', icon: new Icon(Icons.person)),
//                  ),

//                  new TextField(
//                    enabled: false,
//                    controller: _paidController,
//                    decoration: new InputDecoration(
//                        hintText: 'اجل ولا كاش', icon: new Icon(Icons.person)),
//                  ),

//              new TextField(
//                controller: _moneyController,
//                decoration: new InputDecoration(
//                    hintText: 'المدفوع',
//                    icon: new Icon(Icons.person)
//                ),
//              ),
//                  new Center(
//                    child: new Row(
//                      children: <Widget>[
                new Center(
                  child: new Row(
                    //   children: <Widget>[
                    children: <Widget>[
                      new Text("كاش"),
                      new Radio(

                        value: 0,
                        groupValue: _radioValue2,
                        onChanged: _handleRadioValueChangePaid,
                      ),
                      new Text("اجل"),
                      new Radio(
                        value: 1,
                        groupValue: _radioValue2,
                        onChanged: _handleRadioValueChangePaid,
                      ),
                      // Login button
//                        new Container(
//                          width: width_22,
//                          margin: EdgeInsets.only(left: left_01),
//                          child: new RaisedButton(
//                              onPressed: () {
//                                _paidController.text = "1";
//                              },
//                              color: Colors.redAccent,
//                              child: new Text("كاش",
//                                  style: new TextStyle(
//                                      color: Colors.white, fontSize: 16.9))),
//                        ),
//
//                        // Clear button
//                        new Container(
//                          width: width_22,
//                          margin: EdgeInsets.only(left: left_01),
//                          child: new RaisedButton(
//                              onPressed: () {
//                                _paidController.text = "0";
//                              },
//                              color: Colors.redAccent,
//                              child: new Text("اجل",
//                                  style: new TextStyle(
//                                      color: Colors.white, fontSize: 16.9))),
//                        ),
                    ],
                  ),
                ),
//                  new TextField(
//                    enabled: false,
//                    controller: _typeController,
//                    decoration: new InputDecoration(
//                        hintText: 'شراء ولا بيع', icon: new Icon(Icons.person)),
//                  ),
                new Center(
                  child: new Row(
                    //   children: <Widget>[
                    children: <Widget>[
                      new Text("شراء"),
                      new Radio(

                        value: 0,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text("بيع"),
                      new Radio(
                        value: 1,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange,
                      ),
//                    new Radio(
//                      value: 2,
//                      groupValue: _radioValue,
//                      onChanged: _handleRadioValueChange,
//                    ),
                    ],


//                      children: <Widget>[
//                    child: new Row(
//                      children: <Widget>[
//                        // Login button
//                        new Container(
//                          width: width_22,
//                          margin: EdgeInsets.only(left: left_01),
//                          child: new RaisedButton(
//                              onPressed: () {
//                                _typeController.text = "بيع";
//                              },
//                              color: Colors.redAccent,
//                              child: new Text("بيع",
//                                  style: new TextStyle(
//                                      color: Colors.white, fontSize: 16.9))),
//                        ),
//
//                        // Clear button
//                        new Container(
//                          width: width_22,
//                          margin: EdgeInsets.only(left: left_01),
//                          child: new RaisedButton(
//                              onPressed: () {
//                                _typeController.text = "شراء";
//                              },
//                              color: Colors.redAccent,
//                              child: new Text("شراء",
//                                  style: new TextStyle(
//                                      color: Colors.white, fontSize: 16.9))),
//                        ),
//                      ],
//                    ),
//                    ],

                  ),
                ),
//                  new TextField(
//                    // enabled: false,
//                    controller: _moneyController,
//                    decoration: new InputDecoration(
//                        hintText: 'المبلغ', icon: new Icon(Icons.person)),

                new Padding(padding: new EdgeInsets.all(10.5)),
                //add padding
                new Center(
                  child: new Row(
                    children: <Widget>[
                      // Login button
                      new Container(
                        width: width_22,
                        margin: EdgeInsets.only(left: left_01),
                        child: new RaisedButton(

                            onPressed: () async {
//                              getClientId();
//                              if(client==null){
//                                getClientId();
//                              }
                              createBill();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ( context ) =>
                                        InsertBillDetails()),
                              );
                              showToast("تم بنجاح");
                            },
                            color: Colors.redAccent,
                            child: new Text("ادخال",
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 16.9))),
                      ),

                      new Container(
                        width: width_22,
                        margin: EdgeInsets.only(left: left_01),
                        child: new RaisedButton(
                            onPressed: ( ) {
//                                int bo;
//                                if(_paidController.text==1){
//                                  bo =true;
//                                }else{
//                                  bo=false;
//                                }
                              Bill bill = new Bill.foo(
                                  int.parse(_idBill.text),
                                  _nameController.text,
                                  DateTime.now().toString(),
                                  int.parse(_numberController.text),
                                  0.0,
                                  int.parse(_resultPaid),
                                  client.id,
                                  0.0,
                                  _result);
                              updateBill(bill);
                              showToast("تم التحديث");
                            },
                            color: Colors.redAccent,
                            child: new Text("تحديث",
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
                            child: new Text("مسح",
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

  void createBill() {
    int bo;
    if (_resultPaid == "كاش") {
      bo = 1;
    } else {
      bo = 0;
    }
    var pro = new Bill(
        _nameController.text,
        DateTime.now().toString(),
        int.parse(_numberController.text),
        0.0,
        bo,
        client.id,
        0.0,
        _result);

    dh.saveBill(pro);
  }

  void updateBill(Bill bill) async {
    //var pdh=new DatabaseHelper();
    int back = await dh.updateBill(bill);
  }

  getBillFunc(int id) async {
    //var pdh=new DatabaseHelper();
    oneBill = await dh.getBill(id);
    // return oneBill;
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

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          _result = "شراء";
          break;
        case 1:
          _result = "بيع";
          break;

      }
    });
  }

  void _handleRadioValueChangePaid(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          _resultPaid = "كاش";
          break;
        case 1:
          _resultPaid = "اجل";
          break;

      }
    });
  }
void getClientId()async{
    client=await dh.getClient(_nameController.text);
    print("QQQQQQQQQQQQQQQQQQQQQQQQQQQQ${client.id}");
}


//   _showWelcome() {
//    Navigator.push(
//      context,
//      MaterialPageRoute(
//          builder: ( context ) => SearchClient()),
//    );
//  }

}
