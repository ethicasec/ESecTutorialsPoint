import 'dart:ui';

import 'package:flutter/material.dart';

class ActionChipWidgetEx extends StatefulWidget {
  final String title;
  const ActionChipWidgetEx({Key key, this.title}) : super(key: key);

  @override
  _ActionChipWidgetExState createState() => _ActionChipWidgetExState();
}

class _ActionChipWidgetExState extends State<ActionChipWidgetEx> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  List<String> _mychiplist = ["chip1", "chip2", "chip3", "chip4"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text(widget.title.toString()),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Column(
                children: [
                  Text("Scrolling Chips", style: TextStyle(fontSize: 20)),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal, child: chipRow()),
                  Divider(),
                  Text("Un Wrapped Chips", style: TextStyle(fontSize: 20)),
                  chipRow(),
                  Divider(),
                  Text("Wrapped Chips", style: TextStyle(fontSize: 20)),
                  wrapChip(),
                  Divider(),
                  Text("Chip with Avaitor", style: TextStyle(fontSize: 18)),
                  myNormalChip("Chip with Avaitor"),
                  Divider(),
                  Text("Action Chip", style: TextStyle(fontSize: 18)),
                  myActionChipWithAvator("Action Chip"),
                  Divider(),
                  Text("Scrollable Chip With Expanded ListView",
                      style: TextStyle(fontSize: 18)),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        chipRow(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _mychiplist.length,
                itemBuilder: (context, index) {
                  return myChipDeletable(_mychiplist, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chipRow() {
    return Row(
      children: [
        myActionChip("Chip 1"),
        myActionChip("Chip 2"),
        myActionChip("Chip 3"),
        myActionChip("Chip 4"),
        myActionChip("Chip 5"),
        myActionChip("Chip 6"),
        myActionChip("Chip 7"),
        myActionChip("Chip 8"),
      ],
    );
  }

  Widget wrapChip() {
    return Wrap(
      children: [
        myActionChip("Chip 1"),
        myActionChip("Chip 2"),
        myActionChip("Chip 3"),
        myActionChip("Chip 4"),
        myActionChip("Chip 5"),
        myActionChip("Chip 6"),
        myActionChip("Chip 7"),
        myActionChip("Chip 8"),
      ],
    );
  }

  Widget myNormalChip(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Chip(
        padding: EdgeInsets.all(5),
        avatar: CircleAvatar(
          child: Text(text[0].toUpperCase(),
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.grey.shade600,
        ),
        label: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
        elevation: 5,
        backgroundColor: Colors.redAccent,
        shadowColor: Colors.cyan,
      ),
    );
  }

  Widget myChipDeletable(List list, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
        padding: EdgeInsets.all(5),
        avatar: CircleAvatar(
          child: Text(list[index][0].toUpperCase(),
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.grey.shade600,
        ),
        label: Text(list[index],
            style: TextStyle(fontSize: 18, color: Colors.white)),
// onDeleted: list[index].re
        onDeleted: () {
          setState(() {
            list.removeAt(index);
          });
        },
        elevation: 5,
        backgroundColor: Colors.redAccent,
        shadowColor: Colors.cyan,
      ),
    );
  }

  Widget myActionChip(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: ActionChip(
        label: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
        elevation: 5,
        backgroundColor: Colors.deepPurple,
        shadowColor: Colors.amber,
        onPressed: () {
          _globalKey.currentState.showSnackBar(SnackBar(content: Text(text)));
        },
      ),
    );
  }

  Widget myActionChipWithAvator(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: ActionChip(
        padding: EdgeInsets.all(8),
        label: Text(text, style: TextStyle(fontSize: 18)),
        avatar: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.phone_in_talk,
            color: Colors.blue,
          ),
          // child: Text(text[0].toUpperCase(),
          //     style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
        elevation: 5,
        shape: StadiumBorder(
          side: BorderSide(width: 1, color: Colors.blueAccent),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.cyan,
        onPressed: () {
          _globalKey.currentState.showSnackBar(SnackBar(content: Text(text)));
        },
      ),
    );
  }
}
