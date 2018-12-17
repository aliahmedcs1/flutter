//import 'dart:async';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:flutter/material.dart';
//
//
//class Test extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//        alignment: Alignment.center,
//        padding: const EdgeInsets.all(16.0),
//        child: new FutureBuilder(
//            future: FirebaseDatabase.instance.reference().child("customerList").orderByKey().once(),
//            builder: (BuildContext context, AsyncSnapshot snapshot) {
//              if (snapshot.hasData) {
//                if (snapshot.data!=null) {
//                  return new Column (
//                    children: <Widget>[
//                      new Expanded(
//                          child: new ListView(
//                            children: _getData(snapshot),
//                          ))
//                    ],
//                  );
//                } else {
//                  return new CircularProgressIndicator();
//                }
//              }
//            }
//        )
//    );
//
//  }
//
//  List<Widget> _getData(AsyncSnapshot snapshot) {
//
//    //turn the snapshot to a list of widget as you like...
//
//  }
//}
