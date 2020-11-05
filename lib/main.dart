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
      theme: ThemeData.light(),
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: ESecHomePage(),
    );
  }
}
