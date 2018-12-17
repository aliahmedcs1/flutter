import 'dart:async';

class Product {
  String _name;
  String _barcode;
  double _price;
  int _mass;
  int _massFound;
  double _buyPrice;
  double _sellPrice;
  String _type;
  int id;

  Product(this._name, this._barcode,this._price,this._mass,this._massFound,
      this._buyPrice,this._sellPrice,this._type);
  Product.foo(this.id,this._name, this._barcode,this._price,this._mass,this._massFound,
      this._buyPrice,this._sellPrice,this._type);
  Product.map(dynamic obj) {
    this._name = obj['name'];
    this._barcode = obj['barcode'];
    this._price = obj['price'];
    this._mass = obj['mass'];
    this._massFound = obj['massFound'];
    this._buyPrice = obj['buyPrice'];
    this._sellPrice = obj['sellPrice'];
    this._type = obj['type'];
    this.id = obj['id'];
  }
  //Future<String> get name1 => _name;
  String get name => _name;
  String get barcode => _barcode;
  double get price => _price;
  int get mass => _mass;
  int get massFound => _massFound;
  double get buyPrice => _buyPrice;
  double get sellPrice => _sellPrice;
  String get type => _type;
  set mass(int value) => _mass = value;
  set massFound(int value) => _massFound = value;
  //int get id => id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["barcode"] = _barcode;
    map["price"] = _price;
    map["mass"] = _mass;
    map["massFound"] = _massFound;
    map["buyPrice"] = _buyPrice;
    map["sellPrice"] = _sellPrice;
    map["type"] = _type;

    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Product.fromMap(Map<String, dynamic> map) {
    this._name = map['name'];
    this._barcode = map['barcode'];
    this._price = map['price'];
    this._mass = map['mass'];
    this._massFound = map['massFound'];
    this._buyPrice = map['buyPrice'];
    this._sellPrice = map['sellPrice'];
    this._type = map['type'];
    this.id = map["id"];
  }






}