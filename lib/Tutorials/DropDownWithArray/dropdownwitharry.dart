import 'package:flutter/material.dart';

class DropDownWithArray extends StatefulWidget {
  final String title;
  const DropDownWithArray({Key key, this.title}) : super(key: key);
  @override
  _DropDownWithArrayState createState() => _DropDownWithArrayState();
}

class _DropDownWithArrayState extends State<DropDownWithArray> {
  List<DropDownKeyValList> _itemsdata = [
    DropDownKeyValList(item: "Item 1", value: "Value 1"),
    DropDownKeyValList(item: "Item 2", value: "Value 2"),
    DropDownKeyValList(item: "Item 3", value: "Value 3"),
    DropDownKeyValList(item: "Item 4", value: "Value 4"),
    DropDownKeyValList(item: "Item 5", value: "Value 5"),
    DropDownKeyValList(item: "Item 6", value: "Value 6"),
    DropDownKeyValList(item: "Item 7", value: "Value 7"),
    DropDownKeyValList(item: "Item 8", value: "Value 8"),
    DropDownKeyValList(item: "Item 9", value: "Value 9"),
    DropDownKeyValList(item: "Item 10", value: "Value 10"),
  ];
  String _selectedItem = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                dropdownColor: Colors.cyan[50],
                items: _itemsdata
                    .map((data) => DropdownMenuItem<String>(
                          child: Text(data.item),
                          value: data.value,
                        ))
                    .toList(),
                onChanged: (String value) {
                  setState(() => _selectedItem = value);
                },
                hint: Text("Select an Item"),
              ),
              SizedBox(height: 30),
              Text("Selected Item " + _selectedItem,
                  style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}

class DropDownKeyValList {
  String item;
  String value;
  DropDownKeyValList({this.item, this.value});
}
