import 'package:flutter/material.dart';
import 'package:flutter_app/model/Client.dart';
import 'package:flutter_app/utiles/ClientDatabaseHelper.dart';
import 'package:flutter_app/utiles/DatabaseHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
class InsertClient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new InsertClientState();
  }
}

class InsertClientState extends State<InsertClient> {
  double left_01;
  double width_22;
  double width_99;
  static TextEditingController _nameController = new TextEditingController();
  var dh = new DatabaseHelper();
  String _welcomeString = "";

  void _erase() {
    setState(() {
      _nameController.clear();
    });
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
        title: new Text("ادخال عميل"),
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
                  new TextField(
                    controller: _nameController,
                    decoration: new InputDecoration(
                        hintText: 'الاسم', icon: new Icon(Icons.person)),
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
                                createClient1();
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
//                    new BarCodeImage(
//                      data: "1234ABCD",              // Code string. (required)
//                      codeType: BarCodeType.Code39,  // Code type (required)
//                      lineWidth: 2.0,                // width for a single black/white bar (default: 2.0)
//                      barHeight: 90.0,               // height for the entire widget (default: 100.0)
//                      hasText: true,                 // Render with text label or not (default: false)
//                      onError: (error) {             // Error handler
//                        print('error = $error');
//                      },
//                    ),
                      ],
                    ),
                  )
                ],
              ),
            ), //form ends here

//            new Padding(padding: const EdgeInsets.all(14.0)),
//
//            new Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                new Text(
//                  "Welcome, $_welcomeString",
//                  style: new TextStyle(
//                      color: Colors.white,
//                      fontSize: 19.4,
//                      fontWeight: FontWeight.w500),
//                )
//              ],
//            ),
          ],
        ),
      ),
    );
  }catch(e){
  showToast("ادخل كل الحقول كما هو موضح فيها");
  }
  }

  void createClient1()async {
    Client pro = new Client(_nameController.text);
   // var dh = new DatabaseHelper();

    int x=await dh.saveClient(pro);
    print("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS$x");
  }

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
