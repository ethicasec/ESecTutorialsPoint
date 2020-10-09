import 'package:flutter/material.dart';
import 'ESecModel/esectutorialslist.dart';

class ESecHomePage extends StatefulWidget {
  const ESecHomePage({
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
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ethicas Tutorials Point"),
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
                  title:
                      Text("ESec-${index + 1}: ${data.pageTitle.toString()}"),
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
