import 'package:flutter/material.dart';
import 'package:flutter_app/model/Product.dart';
import 'package:flutter_app/utiles/DatabaseHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InsertSepakaProduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new InsertSepakaProductState();
  }
}

class InsertSepakaProductState extends State<InsertSepakaProduct> {
  double left_01;
  double width_22;
  double width_99;
  static Product product;
  static TextEditingController _nameController = new TextEditingController();
  static TextEditingController _parcodeController = new TextEditingController();
  static TextEditingController _priceController = new TextEditingController();
  static TextEditingController _massController = new TextEditingController();
//  static TextEditingController _massFoundController =
//      new TextEditingController();
  static TextEditingController _buyPriceController =
      new TextEditingController();
  static TextEditingController _sellPriceController =
      new TextEditingController();
  static TextEditingController _barcode = new TextEditingController();
  var dh = new DatabaseHelper();
  static Product oneProduct;
  String _welcomeString = "";

  void _erase() {
    setState(() {
      _nameController.clear();
      _parcodeController.clear();
      _priceController.clear();
      _massController.clear();
      //_massFoundController.clear();
      _buyPriceController.clear();
      _sellPriceController.clear();
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
        title: new Text("ادخال منتج سباكة"),
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
//    children: <Widget>[
//    new Container(
//    child: new Row(

                children: <Widget>[
                  new TextField(
                    controller: _barcode,
                    decoration: new InputDecoration(
                        hintText: 'بحث', icon: new Icon(Icons.person)),
                    keyboardType: TextInputType.number,
                  ),
                  new Container(
                    margin: const EdgeInsets.only(left: 38.0),
                    child: new RaisedButton(
                        onPressed: () {
                          //Product product= dh.getProduct(int.parse(_barcode.text)) as Product;
                          ali();
                          //print("AAAAAAAAAAAAAAAAAAAAA$product.name");
                          _nameController.text = product.name;
                          _parcodeController.text = product.barcode;
                          _priceController.text = product.price.toString();
                          _massController.text = product.mass.toString();
//                          _massFoundController.text =
//                              product.massFound.toString();
                          _buyPriceController.text =
                              product.buyPrice.toString();
                          _sellPriceController.text =
                              product.sellPrice.toString();
                          if (product != null) {
                            showToast("تم جلب البيانات");
                          } else {
                            showToast("ابحث مره ثانيه");
                          }
                        },
                        color: Colors.redAccent,
                        child: new Text("ادخال",
                            style: new TextStyle(
                                color: Colors.white, fontSize: 16.9))),
                  ),
//    ],
//    ),
//    ),
                  new Container(
//                    height: 600.0,
//                    width: 380.0,
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        new TextField(
                          controller: _nameController,
                          decoration: new InputDecoration(
                              hintText: 'الاسم', icon: new Icon(Icons.person)),
                        ),

                        new TextField(
                          controller: _parcodeController,
                          decoration: new InputDecoration(
                            hintText: 'باركود',
                            icon: new Icon(Icons.lock),
                          ),
                          keyboardType: TextInputType.number,// obscureText: true,
                        ),
                        new TextField(
                          controller: _priceController,
                          decoration: new InputDecoration(
                              hintText: 'السعر', icon: new Icon(Icons.person)),
                          keyboardType: TextInputType.number,
                        ),

                        new TextField(
                          controller: _massController,
                          decoration: new InputDecoration(
                              hintText: 'الكمية', icon: new Icon(Icons.person)),
                          keyboardType: TextInputType.number,
                        ),

//                        new TextField(
//                          controller: _massFoundController,
//                          decoration: new InputDecoration(
//                              hintText: 'الكمية الفعلية',
//                              icon: new Icon(Icons.person)),
//                          keyboardType: TextInputType.number,
//                        ),

                        new TextField(
                          controller: _buyPriceController,
                          decoration: new InputDecoration(
                              hintText: 'سعر الشراء',
                              icon: new Icon(Icons.person)),
                          keyboardType: TextInputType.number,
                        ),

                        new TextField(
                          controller: _sellPriceController,
                          decoration: new InputDecoration(
                              hintText: 'سعر البيع',
                              icon: new Icon(Icons.person)),
                          keyboardType: TextInputType.number,
                        ),

                        new Padding(
                            padding: new EdgeInsets.all(10.5)), //add padding
                        new Center(
                          child: new Row(
                            children: <Widget>[
                              // Login button
                              new Container(
                                width: width_22,
                                margin: EdgeInsets.only(left: left_01),
                                child: new RaisedButton(
                                    onPressed: () {
                                      createProduct();
                                      showToast("تم بنجاح");
                                    },
                                    color: Colors.redAccent,
                                    child: new Text("ادخال",
                                        style: new TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.9))),
                              ),

                              new Container(
                                width: width_22,
                                margin: EdgeInsets.only(left: left_01),
                                child: new RaisedButton(
                                    onPressed: () {
                                      getProductFunc(product.id);
                                      Product productCurr = new Product.foo(
                                          product.id,
                                          _nameController.text,
                                          _barcode.text,
                                          double.parse(_priceController.text),
                                          int.parse(_massController.text),
                                          0,
                                          double
                                              .parse(_buyPriceController.text),
                                          double
                                              .parse(_sellPriceController.text),
                                          "سباكة");
                                      updateProduct(productCurr);
                                      showToast("تم بنجاح");
                                    },
                                    color: Colors.redAccent,
                                    child: new Text("تحديث",
                                        style: new TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.9))),
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
                                            color: Colors.white,
                                            fontSize: 16.9))),
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
          ],
        ),
      ),
    );
    }catch(e){
      showToast("ادخل كل الحقول كما هو موضح فيها");
    }
  }

  void createProduct() {
    var pro = new Product(
        _nameController.text,
        _parcodeController.text,
        double.parse(_priceController.text),
        int.parse(_massController.text),
        0,
        double.parse(_sellPriceController.text),
        double.parse(_buyPriceController.text),
        "سباكة");

    dh.saveProduct(pro);
  }

  void ali() async {
    //var pdh=new DatabaseHelper();
    product = await dh.getProduct(_barcode.text);
    print(product);
  }

  void updateProduct(Product product) async {
    //var pdh=new DatabaseHelper();
    int back = await dh.updateProduct(product);
  }

  void getProductFunc(int id) async {
    //var pdh=new DatabaseHelper();
    oneProduct = await dh.getProductById(id);
    // return getBill;
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
