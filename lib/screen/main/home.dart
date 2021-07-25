import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../SharedPref.dart';
import '../../constants.dart';

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
        title: Text("OverView"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/ic_notification.svg',
              height: 20.0,
              width: 20.0,
              allowDrawingOutsideViewBox: true,
            ),
            onPressed: () {
              // ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: Container(
        child: Container(
          child: SingleChildScrollView(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            factoryLocal.name,
                            // userLocal.factory.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: borderEdittextColor,
                              fontFamily: 'OpenSans',
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Center(
                        //   child: Text(
                        //     'MONITORING & SCALLING SENSOR',
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //       color: Color(0xFF00B500),
                        //       fontFamily: 'OpenSans',
                        //       fontSize: 18.0,
                        //       fontWeight: FontWeight.normal,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 20),
                        Container(
                          child: Column(children: <Widget>[
                            new Container(
                              child: InteractiveViewer(
                                  panEnabled: false, // Set it to false
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Column(
                                      children: [
                                        Flexible(
                                          child: new CachedNetworkImage(
                                            imageUrl: factoryLocal.overview,
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              height: double.infinity,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                new CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    new Icon(Icons.error),
                                            fadeOutDuration:
                                                new Duration(seconds: 1),
                                            fadeInDuration:
                                                new Duration(seconds: 3),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
