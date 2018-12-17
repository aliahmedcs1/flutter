import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/InsertBill.dart';
import 'package:flutter_app/utiles/DatabaseHelper.dart';
import 'package:material_search/material_search.dart';

class SearchClient extends StatefulWidget {
//   String nameOne ;
//  SearchClient(this.nameOne){
//    SearchClientState._name =nameOne;
//  }
  String todo;
  SearchClient({Key key, @required this.todo}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new SearchClientState();
  }
}

class SearchClientState extends State<SearchClient> {
  double left_01;
  double width_22;
  double width_99;
  static String _name = "noname";
  static var dh = new DatabaseHelper();
  static List _names;
  SearchClientState() {
    ali();
  }
  ali() async {
    var pdh = new DatabaseHelper();
    _names = await pdh.getAllClients();
    print(_names[0]);
  }
//   var _names = const [
//    'Igor Minar',
//    'Brad Green',
//    'Dave Geddes',
//    'Naomi Black',
//    'Greg Weber',
//    'Dean Sofer',
//    'Wes Alvaro',
//    'John Scott',
//    'Daniel Nadasi',
//  ];

  //String _selected;

  final _formKey = new GlobalKey<FormState>();

  _buildMaterialSearchPage(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    width_99 = width * 0.99;
    width_22 = width * 0.22;
    left_01 = width * 0.01;
    return new MaterialPageRoute<String>(
        settings: new RouteSettings(
          name: 'material_search',
          isInitialRoute: false,
        ),
        builder: (BuildContext context) {
          return new Material(
            child: new MaterialSearch<String>(
              placeholder: 'Search',
              results: _names
                  .map((dynamic v) => new MaterialSearchResult<String>(
                        icon: Icons.person,
                        value: v,
                        text: "$v",
                      ))
                  .toList(),
              filter: (dynamic value, String criteria) {
                print("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF" + value);
                return value.toLowerCase().trim().contains(
                    new RegExp(r'' + criteria.toLowerCase().trim() + ''));
              },
              onSelect: (dynamic value) => Navigator.of(context).pop(value),
              onSubmit: (String value) => Navigator.of(context).pop(value),
            ),
          );
        });
  }

  _showMaterialSearch(BuildContext context) {
    Navigator
        .of(context)
        .push(_buildMaterialSearchPage(context))
        .then((dynamic value) {
      setState(() => _name = value as String);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ali(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("بحث"),
              actions: <Widget>[
                new IconButton(
                  onPressed: () {
                    _showMaterialSearch(context);
                  },
                  tooltip: 'Search',
                  icon: new Icon(Icons.search),
                )
              ],
            ),
//        new FutureBuilder(
//        future: ali(),
//    builder: (BuildContext context, AsyncSnapshot snapshot) {
//    return new Container(
            body: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40.0, horizontal: 50.0),
                    child: new Text("الموجود: ${_name ?? 'مفيش'}"),
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 50.0),
                    child: new Form(
                      key: _formKey,
                      child: new Column(
                        children: <Widget>[
                          new MaterialSearchInput<String>(
                            placeholder: 'ادخل اسم',
                            results: _names
                                .map((dynamic v) =>
                                    new MaterialSearchResult<String>(
                                      icon: Icons.person,
                                      value: v['name'],
                                      text: "$v",
                                    ))
                                .toList(),
                            filter: (dynamic value, String criteria) {
                              return value.toLowerCase().trim().contains(
                                  new RegExp(r'' +
                                      criteria.toLowerCase().trim() +
                                      ''));
                            },
                            onSelect: (dynamic v) {
                              _name = v;
                              print(v);
                            },
                            validator: (dynamic value) =>
                                value == null ? 'Required field' : null,
                            formatter: (dynamic v) => '$v',
                          ),
                          new MaterialButton(
                              child: new Text('تم'),
                              color: Colors.redAccent,
                              onPressed: () {
                                 _formKey.currentState.validate();
//                                Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                      builder: (context) =>
//                                          InsertBill.fo(_name)),
//                                );
                                //InsertBill.nametwo=SearchClient.nameOne;
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            floatingActionButton: new FloatingActionButton(
              onPressed: () {
                _showMaterialSearch(context);
              },
              tooltip: 'Search',
              child: new Icon(Icons.search),
            ),
          );
        });
  }
}
