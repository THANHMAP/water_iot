import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ProgressHUD.dart';
import '../../constants.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    // precacheImage(AssetImage("assets/images/bg_app.png"), context);
    return Scaffold(
        appBar: AppBar(
            title: Text("DashBoard"),
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
            new SingleChildScrollView(
              child: new Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: new Column(
                  children: const <Widget>[
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 56.0),
                        title: Text('Two-line ListTile'),
                        subtitle: Text('Here is a second line'),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 56.0),
                        title: Text('Two-line ListTile'),
                        subtitle: Text('Here is a second line'),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 56.0),
                        title: Text('Two-line ListTile'),
                        subtitle: Text('Here is a second line'),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 56.0),
                        title: Text('Two-line ListTile'),
                        subtitle: Text('Here is a second line'),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 56.0),
                        title: Text('Two-line ListTile'),
                        subtitle: Text('Here is a second line'),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 56.0),
                        title: Text('Two-line ListTile'),
                        subtitle: Text('Here is a second line'),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 56.0),
                        title: Text('Two-line ListTile'),
                        subtitle: Text('Here is a second line'),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
