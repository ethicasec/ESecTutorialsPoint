import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

class FoldingCellWithListView extends StatelessWidget {
  final String title;

  FoldingCellWithListView({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fold Widget"),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF2e282a),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return SimpleFoldingCell.create(
              frontWidget: _buildFrontWidget(index),
              innerWidget: _buildInnerWidget(index),
              cellSize: Size(MediaQuery.of(context).size.width, 150),
              padding: EdgeInsets.all(15),
              animationDuration: Duration(milliseconds: 300),
              borderRadius: 10,
              onOpen: () => print('$index cell opened'),
              onClose: () => print('$index cell closed'),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFrontWidget(int index) {
    return Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            final foldingCellState =
                context.findAncestorStateOfType<SimpleFoldingCellState>();
            foldingCellState?.toggleFold();
          },
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 12,
                  child: Stack(children: [
                    Container(
                      color: Colors.blueGrey[900],
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "CARD - ${index + 1}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 0,
                      child: FlatButton(
                        onPressed: () {
                          final foldingCellState =
                              context.findAncestorStateOfType<
                                  SimpleFoldingCellState>();
                          foldingCellState?.toggleFold();
                        },
                        child: Text(
                          "OPEN",
                        ),
                        textColor: Colors.white,
                        color: Colors.orange[900],
                        splashColor: Colors.white.withOpacity(0.5),
                      ),
                    )
                  ]),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color:
                        index % 2 == 0 ? Colors.greenAccent[400] : Colors.amber,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInnerWidget(int index) {
    return Builder(
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          padding: EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 230,
                      color: Colors.orange[900],
                    ),
                  ),
                  Expanded(
                    flex: 99,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        cardTitle(index),
                        cardMiddleLine(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            // color: Colors.green,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                dataRow(Icons.phone, "+91-1234567890"),
                                dataRow(Icons.anchor, "www.yourdomain.com"),
                                dataRow(Icons.home,
                                    "Your address, City, State, etc."),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              FlatButton(
                onPressed: () {
                  final foldingCellState =
                      context.findAncestorStateOfType<SimpleFoldingCellState>();
                  foldingCellState?.toggleFold();
                },
                child: Text(
                  "Close",
                  style: TextStyle(fontSize: 15),
                ),
                textColor: Colors.white,
                color: Colors.blueGrey[900],
                splashColor: Colors.white.withOpacity(0.5),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget cardTitle(int index) {
    return Container(
      height: 80,
      child: Center(
        child: Text(
          "Card ${index + 1}",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget cardMiddleLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 3,
        color: Colors.teal[900],
      ),
    );
  }

  Widget dataRow(IconData icon, String text) {
    return Row(children: <Widget>[
      Icon(icon),
      SizedBox(width: 5),
      Text(
        text,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    ]);
  }
}
