import 'package:flutter/material.dart';

class HeroWidgetAnimation extends StatelessWidget {
  final String title;

  const HeroWidgetAnimation({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title.toString())),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return new SecondHero();
            }));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'hero-tag',
                child: Image.asset(
                  'assets/images/vscode.png',
                  height: 80,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text("Click on Image")
            ],
          ),
        ),
      ),
    );
  }
}

class SecondHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero Animations Example")),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Hero(
                  tag: 'hero-tag',
                  child: Image.asset(
                    'assets/images/vscode.png',
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  )),
              title: Text("My VSCode Image"),
              subtitle: Text("Looks good"),
            ),
          ),
        ],
      ),
    );
  }
}
