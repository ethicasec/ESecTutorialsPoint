import 'package:flutter/material.dart';
import 'exportlibraries.dart';

class ESecTutorialsList {
  String page;
  String pageTitle;
  ESecTutorialsList({this.page, this.pageTitle});
}

// ignore: must_be_immutable
class ESecTutorialRoutes extends StatelessWidget {
  List<ESecTutorialsList> esecTutList = [
    ESecTutorialsList(page: "Welcome", pageTitle: "Welcome to ESec"),
    //
    ESecTutorialsList(page: "EthicaToastPage", pageTitle: "Toast Widget"),
    ESecTutorialsList(
        page: "ActionChipWidgetEx", pageTitle: "Action Chip Widget"),
    ESecTutorialsList(
        page: "HeroWidgetAnimation", pageTitle: "Hero Widget Animation"),
    ESecTutorialsList(page: "EthicaUrlLauncher", pageTitle: "Url Launcher"),
    ESecTutorialsList(
        page: "DropDownWithArray", pageTitle: "DropDownWithArray "),
    ESecTutorialsList(
        page: "FloatingRoundButton", pageTitle: "Floating Round Button"),
    ESecTutorialsList(
        page: "FoldingCellSingle", pageTitle: "Single FoldingCell"),
    ESecTutorialsList(
        page: "FoldingCellWithListView",
        pageTitle: "FoldingCell With ListView"),
  ];

  void switchToTutePage(BuildContext context, String page, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        switch (page) {
          case "Welcome":
            return ESecWelcome(title: title);
          //
          case "EthicaToastPage":
            return EthicaToastPage(title: title);
          case "ActionChipWidgetEx":
            return ActionChipWidgetEx(title: title);
          case "HeroWidgetAnimation":
            return HeroWidgetAnimation(title: title);
          case "EthicaUrlLauncher":
            return EthicaUrlLauncher(title: title);
          case "DropDownWithArray":
            return DropDownWithArray(title: title);
          case "FloatingRoundButton":
            return RoundedButton(title: title);
          case "FoldingCellSingle":
            return SingleFoldingCell(title: title);
          case "FoldingCellWithListView":
            return FoldingCellWithListView(title: title);
          //
          default:
            return ESecWelcome(title: "Ethica Security");
        }
      }),
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
