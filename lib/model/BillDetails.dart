class BillDetails {
  double _mass;
  String _barcode;
  int _bill_id;
  int _id;

  BillDetails(this._mass, this._barcode,this._bill_id);
  BillDetails.foo(this._id,this._mass, this._barcode,this._bill_id);
  BillDetails.map(dynamic obj) {
    this._mass = obj['mass'];
    this._barcode = obj['barcode'];
    this._id = obj['id'];
    this._bill_id=obj['bill_id'];
  }

  double get mass => _mass;
  String get barcode => _barcode;
  int get id => _id;
  int get bill_id => _bill_id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["mass"] = _mass;
    map["barcode"] = _barcode;
    map["bill_id"] = _bill_id;


    if (id != null) {
      map["id"] = _id;
    }
    return map;
  }

  BillDetails.fromMap(Map<String, dynamic> map) {
    this._mass = map['mass'];
    this._barcode = map['barcode'];
    this._id = map["id"];
    this._bill_id = map["bill_id"];
  }






}