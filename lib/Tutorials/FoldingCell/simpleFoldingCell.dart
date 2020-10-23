import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

class SingleFoldingCell extends StatelessWidget {
  final String title;
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  SingleFoldingCell({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fold Widget"),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF2e282a),
        alignment: Alignment.topCenter,
        child: SimpleFoldingCell.create(
            key: _foldingCellKey,
            frontWidget: _buildFrontWidget(),
            innerWidget: _buildInnerWidget(),
            // innerTopWidget: _buildInnerTopWidget(),
            // innerBottomWidget: _buildInnerBottomWidget(),
            cellSize: Size(MediaQuery.of(context).size.width, 150),
            padding: EdgeInsets.all(15),
            animationDuration: Duration(milliseconds: 300),
            borderRadius: 10,
            onOpen: () => print('cell opened'),
            onClose: () => print('cell closed')),
      ),
    );
  }

  Widget _buildFrontWidget() {
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
                          "FOLDED CARD",
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
                        onPressed: () =>
                            _foldingCellKey?.currentState?.toggleFold(),
                        child: Text(
                          "Open",
                        ),
                        textColor: Colors.white,
                        color: Colors.indigoAccent,
                        splashColor: Colors.white.withOpacity(0.5),
                      ),
                    )
                  ]),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.greenAccent[400],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInnerWidget() {
    return Builder(
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          // color: Colors.grey[50],
          padding: EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        cardTitle(),
                        cardMiddleLine(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

  Widget cardTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: Image(
              image: AssetImage("assets/icons/ethicasec.png"), height: 80),
        ),
        Container(
          width: 1,
          height: 50,
          color: Colors.grey[600],
        ),
        Container(
          child: Center(
            child: Text(
              "Card",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget cardMiddleLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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

  // Widget _buildInnerTopWidget() {
  //   return Container(
  //       color: Color(0xFFff9234),
  //       alignment: Alignment.center,
  //       child: Text("TITLE",
  //           style: TextStyle(
  //               color: Color(0xFF2e282a),
  //               fontFamily: 'OpenSans',
  //               fontSize: 20.0,
  //               fontWeight: FontWeight.w800)));
  // }

  // Widget _buildInnerBottomWidget() {
  //   return Container(
  //     color: Color(0xFFecf2f9),
  //     alignment: Alignment.bottomCenter,
  //     child: Padding(
  //       padding: EdgeInsets.only(bottom: 10),
  //       child: FlatButton(
  //         onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
  //         child: Text(
  //           "Close",
  //         ),
  //         textColor: Colors.white,
  //         color: Colors.indigoAccent,
  //         splashColor: Colors.white.withOpacity(0.5),
  //       ),
  //     ),
  //   );
  // }
}
