import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'package:flutter_app/utiles/DatabaseHelper.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
class ProfitView extends StatefulWidget {
  @override
  ProfitViewState createState() {
    return new ProfitViewState();
  }
}

class ProfitViewState extends State<ProfitView> {
  final dateFormat = DateFormat("yyyy-MM-dd");
  final timeFormat = DateFormat("h:mm a");
  static String date1,date2;
  static int profit=0;
 // static TextEditingController _profitController = new TextEditingController();
  DatabaseHelper dh = new DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تقرير الربح"),
      ),
      body: Builder(
      builder: (context) =>ListView(
        children: <Widget>[
          DateTimePickerFormField(
            format: dateFormat,
            onChanged: (date) {
              Scaffold
                  .of(context)

                  .showSnackBar(SnackBar(content: Text('$date')));
              date1=date.toString();
            },
          ),
          DateTimePickerFormField(
            format: dateFormat,
            onChanged: (date) {
              Scaffold
                  .of(context)

                  .showSnackBar(SnackBar(content: Text('$date')));
              date2=date.toString();
            },
          ),
//          TimePickerFormField(
//            format: timeFormat,
//            onChanged: (time) {
//              Scaffold
//                  .of(context)
//                  .showSnackBar(SnackBar(content: Text('$time')));
//            },
//          ),
//          DateTimePickerFormField(
//            format: dateFormat,
//            enabled: false,
//          ),
//          TimePickerFormField(
//            format: toDateFormat(TimeOfDayFormat.HH_colon_mm),
//            enabled: false,
//          ),
          new Container(
           // width: width_20,
            color: Colors.green,
           // margin: EdgeInsets.only(left: left_01),
            child: new RaisedButton(
                onPressed: () async {
                  // _massController.text = name['mass'].toString();
                  int hurry=0;
                  hurry=await dh.getHurryTotalSell(date1,date2);
                              int sell = 0;
                  sell = await dh.getTotalSell(
                                  date1,
                                  date2);
                              int buy =0;
                  buy =await dh.getTotalBuy(
                                  date1,
                                  date2);
                               profit = hurry + sell - buy;
                             // _profitController.text = "$profit";
                             // Navigator.of(context).pop();
                             // showDialog1();

                              showToast("تم بنجاح");
                            },

                color: Colors.blue,
                child: new Text("مكسب",
                    style: new TextStyle(
                        color: Colors.white, fontSize: 14.0))),
          ),
          new Text("الربح يساوى  $profit",textAlign: TextAlign.center,style: new TextStyle(color:
          Colors.green,fontSize: 16.0),)
        ],
      ),
      ),
    );
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
}