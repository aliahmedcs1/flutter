class Bill {
  String _name;
  String _date;
  int _number;
  double _discount;
  int _paid;
  int _id;
  int _client_id;
  double _money;
  String _type;
  Bill(this._name, this._date,this._number,this._discount,this._paid,this._client_id,this._money,this._type);
  Bill.foo( this._id,this._name, this._date,this._number,this._discount,this._paid,this._client_id,this._money,this._type);
  Bill.map(dynamic obj) {
    this._name = obj['name'];
    this._date = obj['date'];
    this._number = obj['number'];
    this._discount = obj['discount'];
    this._paid = obj['paid'];
    this._id = obj['id'];
    this._client_id=obj['client_id'];
    this._money=obj['money'];
    this._type = obj['type'];
  }


  String get name => _name;
  String get date => _date;
  int get number => _number;
  double get discount => _discount;
  int get paid => _paid;
  int get id => _id;
  int get client_id=>_client_id;
  double get money => _money;
  String get type => _type;

  Map<String, dynamic> toMapBill() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["date"] =_date;
    map["number"] = _number;
    map["discount"] = _discount;
    map["paid"] = _paid;
    map["client_id"] = _client_id;
    map["money"] = _money;
    map["type"] = _type;
    if (id != null) {
      map["id"] = _id;

    }
    return map;
  }

  Bill.fromMapBill(Map<String, dynamic> map) {
    this._name = map['name'];
    this._date = map['date'] ;
    this._number = map['number'];
    this._discount = map['discount'];
    this._paid = map['paid'];
    this._id = map["id"];
    this._client_id=map["client_id"];
    this._money=map["money"];
    this._type = map['type'];
  }


//this comment added by ali for test git hub

//this second comment added by ali for test git hub

}