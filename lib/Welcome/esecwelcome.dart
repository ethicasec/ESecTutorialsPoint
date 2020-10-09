import 'package:flutter/material.dart';

class ESecWelcome extends StatefulWidget {
  final String title;
  const ESecWelcome({Key key, this.title}) : super(key: key);
  @override
  _ESecWelcomeState createState() => _ESecWelcomeState();
}

class _ESecWelcomeState extends State<ESecWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.title.toString(),
          style: TextStyle(color: Colors.black),
        ),
        elevation: 2.0,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 80,
              ),
              SizedBox(height: 20),
              Text(
                "Wecome to ESec Tutorial Point",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
