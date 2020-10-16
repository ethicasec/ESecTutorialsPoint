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
        child: SimpleFoldingCell(
            key: _foldingCellKey,
            frontWidget: _buildFrontWidget(),
            innerTopWidget: _buildInnerTopWidget(),
            innerBottomWidget: _buildInnerBottomWidget(),
            cellSize: Size(MediaQuery.of(context).size.width, 200),
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

  Widget _buildInnerTopWidget() {
    return Container(
        color: Color(0xFFff9234),
        alignment: Alignment.center,
        child: Text("TITLE",
            style: TextStyle(
                color: Color(0xFF2e282a),
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.w800)));
  }

  Widget _buildInnerBottomWidget() {
    return Container(
      color: Color(0xFFecf2f9),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: FlatButton(
          onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
          child: Text(
            "Close",
          ),
          textColor: Colors.white,
          color: Colors.indigoAccent,
          splashColor: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
