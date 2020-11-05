import 'package:flutter/material.dart';
import 'ESecModel/esectutorialslist.dart';

// ignore: must_be_immutable
class ESecHomePage extends StatefulWidget {
  ESecHomePage({
    Key key,
  }) : super(key: key);

  @override
  _ESecHomePageState createState() => _ESecHomePageState();
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

class _ESecHomePageState extends State<ESecHomePage> {
  ESecTutorialRoutes _tutorials = ESecTutorialRoutes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: _light ? ThemeData.light() : ThemeData.dark(),
      theme: _light ? _lightTheme : _darkTheme,
      title: 'Material App',
      // darkTheme: _darkTheme,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          title: Text("Ethicas Tutorials Point"),
          actions: [
            Switch(
                value: _light,
                onChanged: (toggle) {
                  setState(() {
                    _light = toggle;
                    print(_light);
                  });
                }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
              child: Center(
            child: ListView.builder(
              itemCount: _tutorials.esecTutList.length != null
                  ? _tutorials.esecTutList.length
                  : 0,
              itemBuilder: (context, index) {
                var data = _tutorials.esecTutList[index];
                return Card(
                  elevation: 2,
                  child: ListTile(
                    leading: FlutterLogo(),
                    title: Text(
                        "Tutorial-${index + 1}: ${data.pageTitle.toString()}"),
                    onTap: () {
                      _tutorials.switchToTutePage(
                          context, data.page, data.pageTitle);
                    },
                  ),
                );
              },
            ),
          )),
        ),
      ),
    );
  }
}
