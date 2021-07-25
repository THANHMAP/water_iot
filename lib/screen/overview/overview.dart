import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_iot/SharedPref.dart';
import 'package:water_iot/model/login_model.dart';

import '../../constants.dart';

class OverViewPage extends StatefulWidget {
  @override
  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverViewPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            leading: IconButton(
                icon: SvgPicture.asset(
                  'assets/images/ic_back.svg',
                  height: 20.0,
                  width: 20.0,
                  allowDrawingOutsideViewBox: true,
                ),
                onPressed: () {
                  Navigator.pop(context);
                })),
      body: Container(
        child: Container(
          child: SingleChildScrollView(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            nameFactory,
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
                                        new CachedNetworkImage(
                                          imageUrl: imgOverViewUrl,
                                          placeholder: (context, url) =>
                                          new CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                          new Icon(Icons.error),
                                          fadeOutDuration:
                                          new Duration(seconds: 1),
                                          fadeInDuration:
                                          new Duration(seconds: 3),
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
