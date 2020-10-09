import 'package:flutter/material.dart';
import 'esechomepage.dart';

void main() {
  runApp(
    new EthicaHomePage(),
  );
}

class EthicaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: ESecHomePage(),
    );
  }
}
