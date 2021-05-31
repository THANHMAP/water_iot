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
    return Scaffold(
        body: Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("assets/images/bg_app.png"),
                  fit: BoxFit.fill)),
        ),
        SingleChildScrollView(
          child: new Container(
            child: new Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 70,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 30)
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          // SizedBox(width: 5),
                          // Image.asset(
                          //   "assets/images/logo.png",
                          //   height: 50,
                          //   width: 50,
                          //   fit: BoxFit.cover,
                          // ),
                          // SizedBox(width: 15),
                          Expanded(
                            child: Container(
                              child: Text(
                                'login to accesss dasboard',
                                style: TextStyle(
                                  color: mTexHeadLoginColor,
                                  fontFamily: 'OpenSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
