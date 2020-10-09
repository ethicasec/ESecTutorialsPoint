import '../DropDownWithArrary/dropdownwitharray.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
// import '../UrlLauncher/urllauncher.dart';
=======
import '../UrlLauncher/urllauncher.dart';
// import 'DropDownWithArrary/dropdownwitharray.dart';
>>>>>>> 1d57b9c24cd07214135284160d10d4a278afa106
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
<<<<<<< HEAD
          // case "EthicaUrlLauncher":
          //   return EthicaUrlLauncher(title: title);
          case "DropDownWithArray":
            return DropDownWithArray(title: title);
=======
          case "EthicaUrlLauncher":
            return EthicaUrlLauncher(title: title);
          // case "DropDownWithArray":
          //   return DropDownWithArray(title: title);
>>>>>>> 1d57b9c24cd07214135284160d10d4a278afa106
          default:
            return ESecWelcome(title: "ESec Tutorial");
        }
        // return Container();
      }),
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
