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
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            userLocal.factory.name,
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
                            Container(
                              foregroundDecoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://p6.storage.canalblog.com/69/50/922142/85510911_o.png'),
                                    fit: BoxFit.fill),
                              ),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    alignment: Alignment(-.2, 0),
                                    image: NetworkImage(
                                        'http://www.naturerights.com/blog/wp-content/uploads/2017/12/Taranaki-NR-post-1170x550.png'),
                                    fit: BoxFit.cover),
                              ),
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.only(bottom: 20),
                              child: Text(
                                "Hello World",
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            // new Container(
                            //   child: InteractiveViewer(
                            //       panEnabled: false, // Set it to false
                            //
                            //       child: AspectRatio(
                            //         aspectRatio: 1,
                            //         child: Column(
                            //           children: [
                            //             new CachedNetworkImage(
                            //               imageUrl: imgOverViewUrl,
                            //               fit: BoxFit.cover,
                            //               width: MediaQuery.of(context).size.width,
                            //               placeholder: (context, url) =>
                            //                   new CircularProgressIndicator(),
                            //               errorWidget: (context, url, error) =>
                            //                   new Icon(Icons.error),
                            //               fadeOutDuration:
                            //                   new Duration(seconds: 1),
                            //               fadeInDuration:
                            //                   new Duration(seconds: 3),
                            //             ),
                            //           ],
                            //         ),
                            //       )),
                            // )
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
