import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    precacheImage(AssetImage("assets/images/bg_app.png"), context);
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "DashBoard",
              style: TextStyle(color: Color(0xFF556DD3)),
            ),
            centerTitle: true,
            leading: IconButton(
                icon: SvgPicture.asset(
                  'assets/images/ic_back.svg',
                  height: 20.0,
                  width: 20.0,
                  allowDrawingOutsideViewBox: true,
                ),
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
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 70,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.2),
                              offset: Offset(0, 10),
                              blurRadius: 20)
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              Expanded(
                                flex: 10,
                                child: Image.asset(
                                  "assets/images/ic_factory.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Expanded(
                                flex: 50,
                                child: Container(
                                  child: Text(
                                    'Factory',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: mTexHeadLoginColor,
                                      fontFamily: 'OpenSans',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // child: Center(
                                  //
                                  // ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Image.asset(
                                  "assets/images/ic_arrow.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 13),
                    Container(
                      width: double.infinity,
                      height: 95,
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color:
                              Theme.of(context).hintColor.withOpacity(0.2),
                              offset: Offset(0, 10),
                              blurRadius: 20)
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              Expanded(
                                flex: 10,
                                child: Image.asset(
                                  "assets/images/ic_factory.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Expanded(
                                flex: 40,
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      'Factory',
                                      style: TextStyle(
                                        color: mTexHeadLoginColor,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Image.asset(
                                  "assets/images/ic_arrow.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 13),
                    Container(
                      width: double.infinity,
                      height: 95,
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color:
                              Theme.of(context).hintColor.withOpacity(0.2),
                              offset: Offset(0, 10),
                              blurRadius: 20)
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              Expanded(
                                flex: 10,
                                child: Image.asset(
                                  "assets/images/ic_factory.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Expanded(
                                flex: 40,
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      'Factory',
                                      style: TextStyle(
                                        color: mTexHeadLoginColor,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Image.asset(
                                  "assets/images/ic_arrow.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 13),
                    Container(
                      width: double.infinity,
                      height: 95,
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color:
                              Theme.of(context).hintColor.withOpacity(0.2),
                              offset: Offset(0, 10),
                              blurRadius: 20)
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              Expanded(
                                flex: 10,
                                child: Image.asset(
                                  "assets/images/ic_factory.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Expanded(
                                flex: 40,
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      'Factory',
                                      style: TextStyle(
                                        color: mTexHeadLoginColor,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Image.asset(
                                  "assets/images/ic_arrow.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),


                    SizedBox(height: 13),
                    Container(
                      width: double.infinity,
                      height: 95,
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color:
                              Theme.of(context).hintColor.withOpacity(0.2),
                              offset: Offset(0, 10),
                              blurRadius: 20)
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              Expanded(
                                flex: 10,
                                child: Image.asset(
                                  "assets/images/ic_factory.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Expanded(
                                flex: 40,
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      'Factory',
                                      style: TextStyle(
                                        color: mTexHeadLoginColor,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Image.asset(
                                  "assets/images/ic_arrow.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),


                    SizedBox(height: 13),
                    Container(
                      width: double.infinity,
                      height: 95,
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color:
                              Theme.of(context).hintColor.withOpacity(0.2),
                              offset: Offset(0, 10),
                              blurRadius: 20)
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              Expanded(
                                flex: 10,
                                child: Image.asset(
                                  "assets/images/ic_factory.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Expanded(
                                flex: 40,
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      'Factory',
                                      style: TextStyle(
                                        color: mTexHeadLoginColor,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Image.asset(
                                  "assets/images/ic_arrow.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),


                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 56.0),
                        title: Text('Two-line ListTile'),
                        subtitle: Text('Here is a second line'),
                        trailing: IconButton(
                            icon: new Image.asset("assets/img/ic_arrow.png"),
                            onPressed: () {
                              // Do something.
                            }),
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
