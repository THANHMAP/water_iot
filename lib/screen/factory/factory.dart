import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_iot/screen/main/main.dart';
import 'package:water_iot/screen/main/setting.dart';

import '../../constants.dart';

class Factory extends StatefulWidget {
  @override
  _FactoryState createState() => _FactoryState();
}

class _FactoryState extends State<Factory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
          title: Text(
            "FACTORY",
            style: TextStyle(color: mTexHeadLoginColor),
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
                Navigator.pop(context);
                // Do something.
              })),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[_buildCard(), _buildCard(), _buildCard(), _buildCard(), _buildCard(), _buildCard(), _buildCard(), _buildCard()],
          ),
        ],
      ),
    );
  }

  Widget _buildCard() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  children: <Widget>[
                    new Row(
                      children: [
                        Flexible(
                          child: Image.asset(
                            "assets/images/header.png",
                          ),
                          // child: Ink.image(
                          //   image: AssetImage("assets/images/header.png"),
                          //   fit: BoxFit.fitWidth,
                          //   height: 190,
                          // ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text('The Enchanted Nightingale'),
                      subtitle:
                          Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 17, horizontal: 60),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MainPage();
                                },
                              ),
                              (route) => false,
                            );
                          },
                          child: Text(
                            "Truy cập",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: loginButtonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        // TextButton(
                        //   child: const Text('BUY TICKETS'),
                        //   onPressed: () {
                        //     /* ... */
                        //   },
                        // ),
                        // const SizedBox(width: 8),
                        // TextButton(
                        //   child: const Text('LISTEN'),
                        //   onPressed: () {
                        //     /* ... */
                        //   },
                        // ),
                        // const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),

              // Row(

              // ),
            ],
          ),
        ),
      ),
    );
  }
}
