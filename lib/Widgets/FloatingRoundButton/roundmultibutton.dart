import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;

  const RoundedButton({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        this.title.toString(),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 60.0,
        width: 250.0,
        child: Material(
          shape: StadiumBorder(),
          textStyle: Theme.of(context).textTheme.button,
          elevation: 6.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  elevation: 0.0,
                  color: Colors.white,
                  shape: new RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 30.0,
                        ),
                        Text("Message", style: TextStyle(fontSize: 10))
                      ],
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: RaisedButton(
                  elevation: 0.0,
                  color: Colors.white,
                  shape: new RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.more_vert,
                          color: Colors.green,
                          size: 30.0,
                        ),
                        Text("More", style: TextStyle(fontSize: 10))
                      ],
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(),
    );
  }
}
