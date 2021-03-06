import 'package:esectutorialspoint/Utils/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ESecModel/esectutorialslist.dart';

// ignore: must_be_immutable
class ESecHomePage extends StatefulWidget {
  var themeData;
  ESecHomePage({
    this.themeData,
    Key key,
  }) : super(key: key);

  @override
  _ESecHomePageState createState() => _ESecHomePageState();
}

class _ESecHomePageState extends State<ESecHomePage> {
  ESecTutorialRoutes _tutorials = ESecTutorialRoutes();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => SwitchListTile(
                title: Text("Dark Theme"),
                value: notifier.darkTheme,
                onChanged: (val) {
                  notifier.toggleTheme();
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ethicas Tutorials Point"),
        actions: [],
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
    );
  }
}
