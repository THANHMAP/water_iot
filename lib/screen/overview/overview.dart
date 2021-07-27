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
            title: Text("Tổng Quan"),
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
        child: Column(
          children: <Widget>[
            Container(
              // color: Colors.blue,
              height: 40,
              child: Center(
                child: Text(
                  factoryLocal.name,
                  // userLocal.factory.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: borderFocusEdittextColor,
                    fontFamily: 'OpenSans',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.amber,
                child: InteractiveViewer(
                    panEnabled: false, // Set it to false
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Column(
                        children: [
                          Flexible(
                            child: new CachedNetworkImage(
                              imageUrl: factoryLocal.overviewApp,
                              imageBuilder: (context, imageProvider) =>
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
                              errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                              fadeOutDuration: new Duration(seconds: 1),
                              fadeInDuration: new Duration(seconds: 3),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
