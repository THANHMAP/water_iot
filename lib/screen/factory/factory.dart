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
                // Do something.
              })),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[_buildCard(), _buildCard2()],
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
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Row(
                      children: [
                        Flexible(
                          child: Image.asset(
                            "assets/images/img_factory1.png",
                            fit: BoxFit.fill,
                            height: 170,
                            width: double.maxFinite,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 13),
                    new Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              'Factory',
                              style: TextStyle(
                                color: textDashboardColor,
                                fontFamily: 'OpenSans',
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // child: Center(
                            //
                            // ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    new Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              'Address: Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet.',
                              style: TextStyle(
                                color: textDashboardColor,
                                fontFamily: 'OpenSans',
                                fontSize: 17.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
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

  Widget _buildCard2() {
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
                            "assets/images/img_factory2.png",
                            fit: BoxFit.fill,
                            height: 170,
                            width: double.maxFinite,
                          ),
                          // child: Ink.image(
                          //   image: AssetImage("assets/images/header.png"),
                          //   fit: BoxFit.fitWidth,
                          //   height: 190,
                          // ),
                        ),
                      ],
                    ),
                    SizedBox(height: 13),
                    new Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              'Factory',
                              style: TextStyle(
                                color: textDashboardColor,
                                fontFamily: 'OpenSans',
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // child: Center(
                            //
                            // ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    new Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              'Address: Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet.',
                              style: TextStyle(
                                color: textDashboardColor,
                                fontFamily: 'OpenSans',
                                fontSize: 17.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
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
