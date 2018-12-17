class Safe {
  //String _name;
  double _money;
  String _type;
  int _id;
  int _client_id;
  String _creditorType;

  Safe( this._money,this._type,this._client_id,this._creditorType);
  Safe.foo(this._id, this._money,this._type,this._client_id,this._creditorType);
  Safe.map(dynamic obj) {
   // this._name = obj['name'];
    this._money = obj['money'];
    this._type = obj['type'];
    this._id = obj['id'];
    this._client_id=obj['client_id'];
    this._creditorType=obj['creditorType'];
  }

 // String get name => _name;
  double get money => _money;
  String get type => _type;
  int get id => _id;
  int get client_id=>_client_id;
  String get creditorType=> _creditorType;
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    //map["name"] = _name;
    map["money"] = _money;
    map["type"] = _type;
    map["client_id"]=_client_id;
    map["creditorType"]=_creditorType;
    if (id != null) {
      map["id"] = _id;
    }
    return map;
  }

  Safe.fromMap(Map<String, dynamic> map) {
    //this._name = map['name'];
    this._money = map['money'];
    this._type = map['type'];
    this._id = map["id"];
    this._client_id=map["client_id"];
    this._creditorType=map["creditorType"];
  }






}