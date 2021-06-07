import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/bg_app.png"), context);
    return Scaffold(
        appBar: AppBar(
            title: Text("Home"),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(Icons.notifications_active),
                onPressed: () {
                  // Do something.
                })),
        body: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/images/overview.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ));
  }
}
