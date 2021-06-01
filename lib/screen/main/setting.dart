import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Setting"),
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
                  image: new AssetImage("assets/images/bg_app.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ));
  }
}
