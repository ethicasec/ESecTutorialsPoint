import 'package:flutter/material.dart';
import '../Welcome/esecwelcome.dart';
import '../Tutorials/UrlLauncher/urllauncher.dart';
import '../Tutorials/DropDownWithArray/dropdownwitharry.dart';
import '../Widgets/FloatingRoundButton/roundmultibutton.dart';
import '../Tutorials/SimpleFoldingCell/simplefoldcelsingle.dart';
import '../Tutorials/SimpleFoldingCell/simplefoldcellwidget.dart';

class ESecTutorialsList {
  String page;
  String pageTitle;
  ESecTutorialsList({this.page, this.pageTitle});
}

// ignore: must_be_immutable
class ESecTutorialRoutes extends StatelessWidget {
  List<ESecTutorialsList> esecTutList = [
    ESecTutorialsList(page: "Welcome", pageTitle: "Welcome to ESec"),
    ESecTutorialsList(page: "EthicaUrlLauncher", pageTitle: "Url Launcher"),
    ESecTutorialsList(
        page: "DropDownWithArray", pageTitle: "DropDownWithArray "),
    ESecTutorialsList(
        page: "FloatingRoundButton", pageTitle: "Floating Round Button"),
    ESecTutorialsList(
        page: "SingleFoldingCell", pageTitle: "SingleFoldingCell"),
    ESecTutorialsList(page: "MultiFoldingCell", pageTitle: "MultiFoldingCell"),
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
          case "FloatingRoundButton":
            return RoundedButton(title: title);
          case "SingleFoldingCell":
            return SingleFoldingCell(title: title);
          case "MultiFoldingCell":
            return MultiFoldingCell(title: title);
          default:
            return ESecWelcome(title: "Ethica Security");
        }
      }),
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
