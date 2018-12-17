class HurrySell {
  String _id;
  String _barcode;
  String _date;
  int _mass;

  HurrySell(this._barcode,this._date,this._mass);

  HurrySell.map(dynamic obj) {

    this._barcode = obj['barcode'];
    this._date = obj['date'];
    this._id = obj['id'];
    this._mass = obj['mass'];
  }

  String get date => _date;
  String get parcode => _barcode;
  int get mass => _mass;
  int get id => id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["date"] = _date;
    map["barcode"] = _barcode;
    map["mass"] = _mass;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  HurrySell.fromMap(Map<String, dynamic> map) {
    this._date = map['date'];
    this._barcode = map['barcode'];
    this._mass = map['mass'];
    this._id = map["id"];
  }






}