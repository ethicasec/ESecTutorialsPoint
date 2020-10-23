import 'package:esectutorialspoint/esechomepage.dart';
import 'package:flutter/material.dart';

class AlertDialogPage extends StatefulWidget {
  AlertDialogPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AlertDialogPageState createState() => new _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text('Show Alert Dialog Box'),
                onPressed: () => showAlertDialogBox(
                  context,
                  "Title",
                  "Your Msg Here i.e goto home page",
                  okOnPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ESecHomePage()));
                  },
                  cancelOnPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialogBox(BuildContext context, String title, String text,
      {Function remindOnPressed,
      Function okOnPressed,
      Function cancelOnPressed}) {
    //
    Widget remindButton =
        FlatButton(child: Text("Remind me later"), onPressed: remindOnPressed);
    Widget okButton = FlatButton(child: Text("OK"), onPressed: okOnPressed);
    Widget cancelButton =
        FlatButton(child: Text("Cancel"), onPressed: cancelOnPressed);
    //
    AlertDialog alertDialog = AlertDialog(
      title: Center(child: Text(title)),
      content: Container(height: 50, child: Center(child: Text(text))),
      actions: [
        cancelButton,
        remindButton,
        okButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
