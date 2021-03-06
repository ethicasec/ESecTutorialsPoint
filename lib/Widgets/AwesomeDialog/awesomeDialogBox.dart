import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AwesomeDialogWidget extends StatefulWidget {
  final String title;
  const AwesomeDialogWidget({
    this.title,
    Key key,
  }) : super(key: key);

  @override
  _AwesomeDialogWidgetState createState() => _AwesomeDialogWidgetState();
}

class _AwesomeDialogWidgetState extends State<AwesomeDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AnimatedButton(
                  text: 'Info Dialog With Fixed Width & Sqare Buttons',
                  color: Colors.cyan,
                  pressEvent: () {
                    AwesomeDialog(
                      context: context,
                      width: 350,
                      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                      headerAnimationLoop: false,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Fix Dialog Square Btn',
                      desc: 'Dialog description',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                AnimatedButton(
                  text: 'Info Dialog Without Button',
                  color: Colors.cyan,
                  pressEvent: () {
                    AwesomeDialog(
                      context: context,
                      headerAnimationLoop: false,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Info Dialog Without Button',
                      desc: 'Dialog description',
                    )..show();
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                AnimatedButton(
                  text: 'Info Dialog',
                  color: Colors.blue[600],
                  pressEvent: () {
                    AwesomeDialog(
                        context: context,
                        animType: AnimType.LEFTSLIDE,
                        headerAnimationLoop: false,
                        dialogType: DialogType.INFO,
                        title: 'Info Dialog',
                        desc: 'Dialog description',
                        btnOkOnPress: () {
                          debugPrint('OnClcik');
                        },
                        btnOkIcon: Icons.check_circle,
                        btnOkColor: Colors.blue[600],
                        onDissmissCallback: () {
                          debugPrint('Dialog Dissmiss from callback');
                        })
                      ..show();
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                AnimatedButton(
                  text: 'Warning Dialog',
                  color: Colors.orange,
                  pressEvent: () {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.WARNING,
                        headerAnimationLoop: false,
                        animType: AnimType.TOPSLIDE,
                        title: 'Warning Dialog',
                        desc: 'Dialog description',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {})
                      ..show();
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                AnimatedButton(
                  text: 'Error Dialog',
                  color: Colors.red,
                  pressEvent: () {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.RIGHSLIDE,
                        headerAnimationLoop: false,
                        title: 'Error Dialog',
                        desc: 'Dialog description',
                        btnOkOnPress: () {},
                        btnOkIcon: Icons.cancel,
                        btnOkColor: Colors.red)
                      ..show();
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                AnimatedButton(
                  text: 'Succes Dialog',
                  color: Colors.green,
                  pressEvent: () {
                    AwesomeDialog(
                        context: context,
                        animType: AnimType.LEFTSLIDE,
                        headerAnimationLoop: false,
                        dialogType: DialogType.SUCCES,
                        title: 'Success Dialog',
                        desc: 'Dialog description',
                        btnOkOnPress: () {
                          debugPrint('OnClcik');
                        },
                        btnOkIcon: Icons.check_circle,
                        onDissmissCallback: () {
                          debugPrint('Dialog Dissmiss from callback');
                        })
                      ..show();
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                AnimatedButton(
                  text: 'No Header Dialog',
                  color: Colors.brown,
                  pressEvent: () {
                    AwesomeDialog(
                      context: context,
                      headerAnimationLoop: false,
                      dialogType: DialogType.NO_HEADER,
                      title: 'No Header Dialog',
                      desc: 'Dialog description',
                      btnOkOnPress: () {
                        debugPrint('OnClcik');
                      },
                      btnOkIcon: Icons.check_circle,
                    )..show();
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                AnimatedButton(
                  text: 'Custom Body Dialog',
                  color: Colors.blueGrey,
                  pressEvent: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.SCALE,
                      dialogType: DialogType.INFO,
                      body: Center(
                        child: Text(
                          'If body is specified, then title and description will be ignored, this allows to further customize the dialogue.',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      title: 'This is Ignored',
                      desc: 'This is also Ignored',
                    )..show();
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                AnimatedButton(
                  text: 'Auto Hide Dialog',
                  color: Colors.purple,
                  pressEvent: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.INFO,
                      animType: AnimType.SCALE,
                      title: 'Auto Hide Dialog',
                      desc: 'AutoHide after 2 seconds',
                      autoHide: Duration(seconds: 2),
                    )..show();
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                AnimatedButton(
                  text: 'Testing Dialog',
                  color: Colors.orange,
                  pressEvent: () {
                    AwesomeDialog(
                      context: context,
                      keyboardAware: true,
                      dismissOnBackKeyPress: false,
                      dialogType: DialogType.WARNING,
                      animType: AnimType.BOTTOMSLIDE,
                      btnCancelText: "Cancel Order",
                      btnOkText: "Yes, I will pay",
                      title: 'Continue to pay?',
                      padding: const EdgeInsets.all(16.0),
                      desc:
                          'Please confirm that you will pay 3000 INR within 30 mins',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    ).show();
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                AnimatedButton(
                  text: 'Body with Input',
                  color: Colors.blueGrey,
                  pressEvent: () {
                    AwesomeDialog dialog;
                    dialog = AwesomeDialog(
                      context: context,
                      animType: AnimType.SCALE,
                      dialogType: DialogType.INFO,
                      keyboardAware: true,
                      body: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Form Data',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Material(
                              elevation: 0,
                              color: Colors.blueGrey.withAlpha(40),
                              child: TextFormField(
                                autofocus: true,
                                minLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Title',
                                  prefixIcon: Icon(Icons.text_fields),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Material(
                              elevation: 0,
                              color: Colors.blueGrey.withAlpha(40),
                              child: TextFormField(
                                autofocus: true,
                                keyboardType: TextInputType.multiline,
                                maxLengthEnforced: true,
                                minLines: 2,
                                maxLines: null,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Description',
                                  prefixIcon: Icon(Icons.text_fields),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AnimatedButton(
                                text: 'Close',
                                icon: Icons.cancel,
                                pressEvent: () {
                                  dialog.dissmiss();
                                })
                          ],
                        ),
                      ),
                    )..show();
                  },
                ),
              ],
            ),
          ),
        )));
  }
}
