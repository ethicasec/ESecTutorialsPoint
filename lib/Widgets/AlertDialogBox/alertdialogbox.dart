import 'dart:io';
import 'package:esectutorialspoint/esechomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                    context, "Title", "Your Msg Here i.e goto home page",
                    okOnPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ESecHomePage()));
                }, cancelOnPressed: () {
                  Navigator.pop(context);
                }, exitOnPressed: () {
                  // exit(0);
                  // Not recommand b'coz it terminate dart process directly and may be crash the app
                  // SystemNavigator.pop();
                  Future.delayed(const Duration(milliseconds: 1000), () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  });
                  // Future.delayed(Duration(seconds: 1), () {
                  //   exit(0);
                  // });
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialogBox(BuildContext context, String title, String text,
      {Function okOnPressed,
      Function exitOnPressed,
      Function cancelOnPressed}) {
    //

    Widget okButton = FlatButton(child: Text("OK"), onPressed: okOnPressed);
    Widget exitButton =
        FlatButton(child: Text("Exit"), onPressed: exitOnPressed);
    Widget cancelButton =
        FlatButton(child: Text("Cancel"), onPressed: cancelOnPressed);
    //
    AlertDialog alertDialog = AlertDialog(
      title: Center(child: Text(title)),
      content: Container(height: 50, child: Center(child: Text(text))),
      actions: [
        exitButton,
        cancelButton,
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
