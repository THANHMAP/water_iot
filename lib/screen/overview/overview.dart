import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        body: Stack(
          children: <Widget>[
            new Container(child: InteractiveViewer(
              panEnabled: false, // Set it to false

              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  'assets/images/overview.png',
                  fit: BoxFit.fill,
                ),
              )
            ),
                // decoration: new BoxDecoration(
                //   image: new DecorationImage(
                //     image: new AssetImage("assets/images/overview.png"),
                //     fit: BoxFit.contain,
                //   ),
                // ),
                ),
          ],
        ));
  }
}
