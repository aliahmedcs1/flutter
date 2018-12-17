import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  TestState createState() {
    return new TestState();
  }
}

class TestState extends State<Test> {
  Widget bodyData() => DataTable(
      onSelectAll: (b) {},
      sortColumnIndex: 1,
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(
          label: Text("First Name"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              names.sort((a, b) => a.firstName.compareTo(b.firstName));
            });
          },
          tooltip: "To display first name of the Name",
        ),
        DataColumn(
          label: Text("Last Name"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              names.sort((a, b) => a.lastName.compareTo(b.lastName));
            });
          },
          tooltip: "To display last name of the Name",
        ),
      ],
      rows: names
          .map(
            (name) => DataRow(
          cells: [
            DataCell(
              Text(name.firstName.toString()),
              showEditIcon: false,
              placeholder: false,
            ),
            DataCell(
              Text(name.lastName),
              showEditIcon: false,
              placeholder: false,
            )
          ],
        ),
      )
          .toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Episode 5 - Data Table"),
      ),
      body: Container(
        child: bodyData(),
      ),
    );
  }
}

class Name {
  int firstName;
  String lastName;

  Name({this.firstName, this.lastName});
}

var names = <Name>[
  Name(firstName:111, lastName: "Kumar"),
  Name(firstName: 222, lastName: "Tewari"),
//  Name(firstName: "Rohan", lastName: "Singh"),
];