import 'package:flutter/material.dart';

class DarkThemeDemo extends StatefulWidget {
  final String title;

  const DarkThemeDemo({Key key, this.title}) : super(key: key);
  @override
  _DarkThemeDemoState createState() => _DarkThemeDemoState();
}

bool _light = true;

ThemeData _darkTheme = ThemeData(
  accentColor: Colors.red,
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
);

ThemeData _lightTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue);

class _DarkThemeDemoState extends State<DarkThemeDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _light ? _lightTheme : _darkTheme,
      title: 'Material App',
      darkTheme: _darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Center(
          child: Switch(
              value: _light,
              onChanged: (toggle) {
                setState(() {
                  _light = toggle;
                });
              }),
        ),
      ),
    );
  }
}
