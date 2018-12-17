import 'package:flutter/material.dart';
import 'package:flutter_app/model/Client.dart';
import 'package:flutter_app/model/Product.dart';
import 'package:flutter_app/model/Safe.dart';
import 'package:flutter_app/ui/SearchClient.dart';
import 'package:flutter_app/ui/SearchClientToSafe.dart';
import 'package:flutter_app/ui/ViewSafe.dart';
import 'package:flutter_app/utiles/DatabaseHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';

//List _cities;
//var dh=new DatabaseHelper();
class InsertSafe extends StatefulWidget {
  int todo;
  InsertSafe.co({Key key, @required this.todo}) : super(key: key);
  String nameOne;
  InsertSafe.fo(this.nameOne) {
    InsertSafeState._nameController.text = nameOne;
  }
 // int idValue;

  InsertSafe() {}
  @override
  State<StatefulWidget> createState() {
    // ali();
    return new InsertSafeState();
  }
//  void ali() async {
//    //var pdh=new DatabaseHelper();
//    _cities= await dh.getAllClients();
//    print(_cities[0]);
//  }
}

class InsertSafeState extends State<InsertSafe> {
  double left_01;
  double width_22;
  double width_99;
  static Client client;
  static TextEditingController _nameController = new TextEditingController();
  static TextEditingController _moneyController = new TextEditingController();
 // static TextEditingController _typeController = new TextEditingController();
//  static TextEditingController _clientIdController =
//      new TextEditingController();
  //static TextEditingController _creditorTypeController =
     // new TextEditingController();
  static TextEditingController _clientIdController = new TextEditingController();
  String _welcomeString = "";
  static String _currentCity;
  static Safe oneSafe;
  static String  _result ;
  static String  _resultType ;
  static int   _radioValue1;
  static int   _radioValue2;
 // static String valueForId;
  var dh = new DatabaseHelper();
  static List _cities;
  InsertSafeState() {
    ali();
    getClient();
  }
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  @override
//  void initState() {
//    _dropDownMenuItems = getDropDownMenuItems();
//
//    _currentCity = _dropDownMenuItems[0].value;
//
//    String _getValue = _dropDownMenuItems[0]
//        .value
//        .substring(5, _dropDownMenuItems[0].value.indexOf(","));
//    print("AAAAAAAAAAAAAAAAAAA$_getValue");
//    valueForId=_getValue;
//    //print("AAAAAAAAAAAAAAAAAAA$valueForId");
//    // _currentCity = "mmmmmm";
//    super.initState();
//  }

  void _erase() {
    setState(() {
      //_nameController.clear();
      _moneyController.clear();
     // _typeController.clear();
      //_clientIdController.clear();
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
        title: new Text("ادخال ايصال"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
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
//    new Container(
//      height: 600.0,
//      width: 380.0,
//    child: new Row(
//
//    children:<Widget>[
            new TextField(
              controller: _clientIdController,
              decoration: new InputDecoration(
                  hintText: ' بحث برقم العميل', icon: new Icon(Icons.person)),
              keyboardType: TextInputType.number,
            ),
            new Container(
              width: 30.0,
             // margin: const EdgeInsets.only(left: 38.0),
              child: new RaisedButton(

                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewSafe.fo(int.parse(_clientIdController.text))),
                  );
                  Safe safe = await dh.getSafe(int.parse(_clientIdController.text));
                  // _nameController =safe.name as TextEditingController ;
                  _moneyController.text = safe.money.toString();
                  _resultType = safe.type;
                  client.name;
                  _result = safe.creditorType;
                  if (safe != null) {
                    showToast("تم جلب البيانات");
                  } else {
                    showToast("ابحث مره ثانيه");
                  }
                },
                  color: Colors.redAccent,
                  child: new Text("بحث",
                      style: new TextStyle(
                          color: Colors.white, fontSize: 16.9))
              ),
//    ),
//      ],
            ),

            // ),
            new Container(
//              height: 600.0,
//              width: 380.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
//                  new Container(
////              color: Colors.white,
////                  child: new Center(
//                    child: new DropdownButton(
//                      value: _currentCity,
//                      items: _dropDownMenuItems,
//                      onChanged: changedDropDownItem,
//                    ),
//                    //  )
//                  ),

                  new TextField(
                    enabled: false,
                    controller: _nameController,
                    decoration: new InputDecoration(
                        hintText: 'رقم العميل',
                        icon: new Icon(Icons.person),

                    ),

                  ),
                  new Container(
                    width: width_22,
                    margin: EdgeInsets.only(left: left_01),
                    child: new RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchClientToSafe()),
                          );

                        },
                        color: Colors.redAccent,
                        child: new Text("الاسم",
                            style: new TextStyle(
                                color: Colors.white, fontSize: 16.9))),
                  ),

                  new TextField(
                    controller: _moneyController,
                    decoration: new InputDecoration(
                      hintText: 'المبلغ',
                      icon: new Icon(Icons.lock),
                    ),
                    keyboardType: TextInputType.number,
                  ),
//                  new TextField(
//                    enabled: false,
//                    controller: _resultType,
//                    decoration: new InputDecoration(
//                        hintText: 'صرف ولا ايداع',
//                        icon: new Icon(Icons.person)),
//                  ),

                  new Center(
                    child: new Row(
                      children: <Widget>[
                        // Login button
                        new Text("ايداع"),
                        new Radio(

                          value: 0,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChangeType,
                        ),
                        new Text("صرف"),
                        new Radio(
                          value: 1,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChangeType,
                        ),
                      ],
                    ),
                  ),
//                  new TextField(
//                    controller: _clientIdController,
//                    decoration: new InputDecoration(
//                        hintText: 'الاسم', icon: new Icon(Icons.person)),
//                  ),

//                  new TextField(
//                    enabled: false,
//                    controller: _creditorTypeController,
//                    decoration: new InputDecoration(
//                        hintText: 'دائن ولا مدين',
//                        icon: new Icon(Icons.person)),
//                  ),

                  new Center(
                    child: new Row(
                      children: <Widget>[
                        // Login button
                        new Text("مدين"),
                        new Radio(

                          value: 0,
                          groupValue: _radioValue2,
                          onChanged: _handleRadioValueChange,
                        ),
                        new Text("دائن"),
                        new Radio(
                          value: 1,
                          groupValue: _radioValue2,
                          onChanged: _handleRadioValueChange,
                        ),
                      ],
                    ),
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
                                createSafe();
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
                              onPressed: () {
                                getSafeFunc(oneSafe.id);
                                Safe safeCurr = new Safe.foo(
                                    oneSafe.id,
                                    double.parse(_moneyController.text),
                                    _resultType,
                                    client.id,
                                    _result);
                                updateSafe(safeCurr);
                                showToast("تم بنجاح");
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
                              child: new Text("Clear",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 16.9))),
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

  void createSafe() {
    //print("BBBBBBBBBBBBBBB$_currentCity DDDDDDDDDD$valueForId");
    var pro = new Safe(
        double.parse(_moneyController.text),
        _resultType,
        client.id,
        _result);


    dh.saveSafe(pro);
  }
//
//  void changedDropDownItem(String selectedCity) {
//    print("Selected city $selectedCity, we are going to refresh the UI");
//    setState(() {
//      _currentCity = selectedCity;
//      valueForId=_currentCity.substring(5,_currentCity.indexOf(","));
//      print("ZZZZZZZZZZZZZZZZZZZZ$valueForId");
//    });
//  }
//
//  List<DropdownMenuItem<String>> getDropDownMenuItems() {
//    List<DropdownMenuItem<String>> items = new List();
//    // _cities.forEach(element)=>print(element);
//    _cities.forEach((element) {
//     // print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX$element");
//      // here we are creating the drop down menu items, you can customize the item right here
//      // but I'll just use a simple text for this
//      items.add(new DropdownMenuItem(
//          value: element.toString(), child: new Text(element.toString())));
//
//    });
//    return items;
//  }

  void ali() async {
    //var pdh=new DatabaseHelper();
    _cities = await dh.getAllClients();
    print(_cities[0]);
  }

  void updateSafe(Safe safe) async {
    //var pdh=new DatabaseHelper();
    int back = await dh.updateSafe(safe);
  }

  void getSafeFunc(int id) async {
    //var pdh=new DatabaseHelper();
    oneSafe = await dh.getSafe(id);
    // return getBill;
  }
  void getClient() async {
    print("PPPPPPPPPPPPPPPPPPPPPPPPP$client");
    client=await dh.getClient(_nameController.text);
print("PPPPPPPPPPPPPPPPPPPPPPPPP$client");
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          _result = "مدين";
          break;
        case 1:
          _result = "دائن";
          break;

      }
    });
  }

  void _handleRadioValueChangeType(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          _resultType = "ايداع";
          break;
        case 1:
          _resultType = "صرف";
          break;

      }
    });
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

}
