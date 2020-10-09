import '../DropDownWithArrary/dropdownwitharray.dart';
import 'package:flutter/material.dart';
// import '../UrlLauncher/urllauncher.dart';
import '../Welcome/esecwelcome.dart';

class ESecTutorialsList {
  String page;
  String pageTitle;
  ESecTutorialsList({this.page, this.pageTitle});
}

// ignore: must_be_immutable
class ESecTutorialRoutes extends StatelessWidget {
  List<ESecTutorialsList> esecTutList = [
    ESecTutorialsList(
        page: "EthicaUrlLauncher", pageTitle: "Url Launcher Tutorial"),
    ESecTutorialsList(
        page: "DropDownWithArray", pageTitle: "DropDownWithArray Tutorial"),
    // ESecTutorialsList(page: "DropDownWith", pageTitle: "DropDownWithArray "),
  ];

  void switchToTutePage(BuildContext context, String page, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        switch (page) {
          // case "EthicaUrlLauncher":
          //   return EthicaUrlLauncher(title: title);
          case "DropDownWithArray":
            return DropDownWithArray(title: title);
          default:
            return ESecWelcome(title: "ESec Tutorial");
        }
        // return Container();
      }),
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
