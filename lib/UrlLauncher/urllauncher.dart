import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EthicaUrlLauncher extends StatefulWidget {
  final String title;
  const EthicaUrlLauncher({Key key, this.title}) : super(key: key);
  @override
  _EthicaUrlLauncherState createState() => _EthicaUrlLauncherState();
}

class _EthicaUrlLauncherState extends State<EthicaUrlLauncher> {
  Future<void> _launched;
  String url = "https://www.google.com";
  String phoneNo = "01234567890";

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{"my_header_key": "my_header_value"},
      );
    } else {
      throw "Could not launch $url";
    }
  }

  Future<void> _launchInApp(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{"my_header_key": "my_header_value"},
      );
    } else {
      throw "Could not launch $url";
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw "Could not make phone call $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              RaisedButton(
                child: Text("Launch in Browser"),
                onPressed: () {
                  setState(() {
                    _launched = _launchInBrowser(url);
                  });
                },
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text("Launch in App"),
                onPressed: () {
                  setState(() {
                    _launched = _launchInApp(url);
                  });
                },
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text("Make a Phone Call"),
                onPressed: () {
                  setState(() {
                    _launched = _makePhoneCall("tel:$phoneNo");
                  });
                },
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text("Auto Close WebView After 5 Seconds"),
                onPressed: () {
                  setState(() {
                    _launched = _launchInApp(url);
                  });

                  Timer(Duration(seconds: 5), () {
                    closeWebView();
                  });
                },
              ),
              SizedBox(height: 10),
              FutureBuilder(
                  future: _launched,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Snapshot Error: ${snapshot.hasError}");
                    } else {
                      return Container(child: Text("Launched"));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
