import 'package:flutter/material.dart';
import '../Welcome/esecwelcome.dart';
import '../UrlLauncher/urllauncher.dart';
import '../DropDownWithArray/dropdownwitharry.dart';

class ESecTutorialsList {
  String page;
  String pageTitle;
  ESecTutorialsList({this.page, this.pageTitle});
}

// ignore: must_be_immutable
class ESecTutorialRoutes extends StatelessWidget {
  List<ESecTutorialsList> esecTutList = [
    ESecTutorialsList(page: "Welcome", pageTitle: "Welcome to ESec"),
    ESecTutorialsList(
        page: "EthicaUrlLauncher", pageTitle: "Tutorial: Url Launcher"),
    ESecTutorialsList(
        page: "DropDownWithArray", pageTitle: "Tutorial: DropDownWithArray "),
  ];

  void switchToTutePage(BuildContext context, String page, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        switch (page) {
          case "Welcome":
            return ESecWelcome(title: title);
          case "EthicaUrlLauncher":
            return EthicaUrlLauncher(title: title);
          case "DropDownWithArray":
            return DropDownWithArray(title: title);
          default:
            return ESecWelcome(title: "Ethica Security");
        }
      }),
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
