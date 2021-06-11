import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            // leading: IconButton(
            //     icon: Icon(Icons.notifications_active),
            //     onPressed: () {
            //       // Do something.
            //     })
        ),
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
