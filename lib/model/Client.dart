class Client {
  String _name;

  int _id;

  Client(this._name);
  Client.fo(this._id,this._name);
  Client.map(dynamic obj) {
    this._name = obj['name'];
    this._id = obj['id'];
  }

  String get name => _name;
  int get id => _id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;

    if (id != null) {
      map["id"] = _id;
    }
    return map;
  }

  Client.fromMap(Map<String, dynamic> map) {
    this._name = map['name'];
    this._id = map["id"];
  }






}