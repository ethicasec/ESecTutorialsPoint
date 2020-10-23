import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

// toast 0.1.5
class EthicaToastPage extends StatefulWidget {
  EthicaToastPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _EthicaToastPageState createState() => new _EthicaToastPageState();
}

class _EthicaToastPageState extends State<EthicaToastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                  child: Text('Show Short Duration Toast'),
                  onPressed: () => showToast("Show Short Duration Toast")),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                  child: Text('Show Long Duration Toast'),
                  onPressed: () => showToast("Show Long Duration Toast",
                      duration: Toast.LENGTH_LONG)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                  child: Text('Show Bottom Gravity  Toast'),
                  onPressed: () => showToast("Show Bottom Gravity Toast",
                      gravity: Toast.BOTTOM)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                  child: Text('Show Center Gravity  Toast'),
                  onPressed: () => showToast("Show Center Gravity  Toast",
                      gravity: Toast.CENTER)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                  child: Text('Show Top Gravity  Toast'),
                  onPressed: () =>
                      showToast("Show Top Gravity Toast", gravity: Toast.TOP)),
            ),
          ],
        ),
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
