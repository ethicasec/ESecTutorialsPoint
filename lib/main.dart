import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Utils/theme.dart';
import 'Utils/themeProvider.dart';
import 'esechomepage.dart';

void main() {
  runApp(
    new EthicaHomePage(),
  );
}

class EthicaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: notifier.darkTheme ? dark : light,
          home: ESecHomePage(),
        );
      }),
    );
  }
}
