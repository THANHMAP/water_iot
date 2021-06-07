import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_iot/screen/main/main.dart';
import 'package:water_iot/screen/main/setting.dart';

import '../../constants.dart';

class SensorPage extends StatefulWidget {
  @override
  _SensorState createState() => _SensorState();
}

class _SensorState extends State<SensorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
          title: Text(
            "SENSOR",
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
          Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 0),
            child: ListView(
              children: <Widget>[_buildCardPUMP(), _buildCardProcess(), _buildCardChemical(), _buildCardSupply()],
            ),
          )

        ],
      ),
    );
  }

  Widget _buildCardPUMP() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                height: 100,
                color: Color(0xFF556DD3),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            // color: Colors.amber,
                            // height: 100,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset(
                                "assets/images/ic_pump.svg",
                                color: Color(0xFFF4F5F8),
                                height: 70,
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      // color: Colors.amber,

                                      child: Text(
                                        "RAW PUMP STATION",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 10.0),
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Image.asset(
                                        "assets/images/ic_arrow_down.png",
                                        height: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.blue,
                          height: 100,
                          width: 30,
                        ),

                        // Expanded(
                        //   child: Container(
                        //     child: SvgPicture.asset(
                        //       "assets/images/ic_pump.svg",
                        //       color: Color(0xFFF4F5F8),
                        //       height: 70,
                        //     ),
                        //   ),
                        // ),
                        // Expanded(
                        //   child: Container(
                        //     color: Colors.amber,
                        //     child: Text(
                        //       "Truy cập",
                        //       style: TextStyle(color: Colors.white,
                        //           fontSize: 20),
                        //     ),
                        //   ),
                        // ),
                        // Flexible(
                        //   child: Image.asset(
                        //     "assets/images/header.png",
                        //   ),
                        //   // child: Ink.image(
                        //   //   image: AssetImage("assets/images/header.png"),
                        //   //   fit: BoxFit.fitWidth,
                        //   //   height: 190,
                        //   // ),
                        // ),
                      ],
                    ),
                    // ListTile(
                    //   title: Text('The Enchanted Nightingale'),
                    //   subtitle:
                    //   Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: <Widget>[
                    //     FlatButton(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 17, horizontal: 60),
                    //       onPressed: () {
                    //         Navigator.pushAndRemoveUntil(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) {
                    //               return MainPage();
                    //             },
                    //           ),
                    //               (route) => false,
                    //         );
                    //       },
                    //       child: Text(
                    //         "Truy cập",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //       color: loginButtonColor,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10.0),
                    //       ),
                    //     ),
                    //     // TextButton(
                    //     //   child: const Text('BUY TICKETS'),
                    //     //   onPressed: () {
                    //     //     /* ... */
                    //     //   },
                    //     // ),
                    //     // const SizedBox(width: 8),
                    //     // TextButton(
                    //     //   child: const Text('LISTEN'),
                    //     //   onPressed: () {
                    //     //     /* ... */
                    //     //   },
                    //     // ),
                    //     // const SizedBox(width: 8),
                    //   ],
                    // ),
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

  Widget _buildCardProcess() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                height: 100,
                color: Color(0xFF556DD3),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            // color: Colors.amber,
                            // height: 100,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset(
                                "assets/images/ic_process.svg",
                                color: Color(0xFFF4F5F8),
                                height: 70,
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "PROCESS STATION",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 10.0),
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Image.asset(
                                        "assets/images/ic_arrow_down.png",
                                        height: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.blue,
                          height: 100,
                          width: 40,
                        ),

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

  Widget _buildCardChemical() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                height: 100,
                color: Color(0xFF556DD3),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            // color: Colors.amber,
                            // height: 100,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset(
                                "assets/images/ic_chemical.svg",
                                color: Color(0xFFF4F5F8),
                                height: 70,
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      // color: Colors.amber,

                                      child: Text(
                                        "CHEMICAL STATION",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 10.0),
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Image.asset(
                                        "assets/images/ic_arrow_down.png",
                                        height: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.blue,
                          height: 100,
                          width: 30,
                        ),

                        // Expanded(
                        //   child: Container(
                        //     child: SvgPicture.asset(
                        //       "assets/images/ic_pump.svg",
                        //       color: Color(0xFFF4F5F8),
                        //       height: 70,
                        //     ),
                        //   ),
                        // ),
                        // Expanded(
                        //   child: Container(
                        //     color: Colors.amber,
                        //     child: Text(
                        //       "Truy cập",
                        //       style: TextStyle(color: Colors.white,
                        //           fontSize: 20),
                        //     ),
                        //   ),
                        // ),
                        // Flexible(
                        //   child: Image.asset(
                        //     "assets/images/header.png",
                        //   ),
                        //   // child: Ink.image(
                        //   //   image: AssetImage("assets/images/header.png"),
                        //   //   fit: BoxFit.fitWidth,
                        //   //   height: 190,
                        //   // ),
                        // ),
                      ],
                    ),
                    // ListTile(
                    //   title: Text('The Enchanted Nightingale'),
                    //   subtitle:
                    //   Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: <Widget>[
                    //     FlatButton(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 17, horizontal: 60),
                    //       onPressed: () {
                    //         Navigator.pushAndRemoveUntil(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) {
                    //               return MainPage();
                    //             },
                    //           ),
                    //               (route) => false,
                    //         );
                    //       },
                    //       child: Text(
                    //         "Truy cập",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //       color: loginButtonColor,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10.0),
                    //       ),
                    //     ),
                    //     // TextButton(
                    //     //   child: const Text('BUY TICKETS'),
                    //     //   onPressed: () {
                    //     //     /* ... */
                    //     //   },
                    //     // ),
                    //     // const SizedBox(width: 8),
                    //     // TextButton(
                    //     //   child: const Text('LISTEN'),
                    //     //   onPressed: () {
                    //     //     /* ... */
                    //     //   },
                    //     // ),
                    //     // const SizedBox(width: 8),
                    //   ],
                    // ),
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

  Widget _buildCardSupply() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                height: 100,
                color: Color(0xFF556DD3),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            // color: Colors.amber,
                            // height: 100,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset(
                                "assets/images/ic_supply.svg",
                                color: Color(0xFFF4F5F8),
                                height: 70,
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding:
                                      EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      // width: 100,
                                      child: Text(
                                        "SUPPLY STATION",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 10.0),
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Image.asset(
                                        "assets/images/ic_arrow_down.png",
                                        height: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.blue,
                          height: 100,
                          width: 30,
                        ),

                        // Expanded(
                        //   child: Container(
                        //     child: SvgPicture.asset(
                        //       "assets/images/ic_pump.svg",
                        //       color: Color(0xFFF4F5F8),
                        //       height: 70,
                        //     ),
                        //   ),
                        // ),
                        // Expanded(
                        //   child: Container(
                        //     color: Colors.amber,
                        //     child: Text(
                        //       "Truy cập",
                        //       style: TextStyle(color: Colors.white,
                        //           fontSize: 20),
                        //     ),
                        //   ),
                        // ),
                        // Flexible(
                        //   child: Image.asset(
                        //     "assets/images/header.png",
                        //   ),
                        //   // child: Ink.image(
                        //   //   image: AssetImage("assets/images/header.png"),
                        //   //   fit: BoxFit.fitWidth,
                        //   //   height: 190,
                        //   // ),
                        // ),
                      ],
                    ),
                    // ListTile(
                    //   title: Text('The Enchanted Nightingale'),
                    //   subtitle:
                    //   Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: <Widget>[
                    //     FlatButton(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 17, horizontal: 60),
                    //       onPressed: () {
                    //         Navigator.pushAndRemoveUntil(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) {
                    //               return MainPage();
                    //             },
                    //           ),
                    //               (route) => false,
                    //         );
                    //       },
                    //       child: Text(
                    //         "Truy cập",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //       color: loginButtonColor,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10.0),
                    //       ),
                    //     ),
                    //     // TextButton(
                    //     //   child: const Text('BUY TICKETS'),
                    //     //   onPressed: () {
                    //     //     /* ... */
                    //     //   },
                    //     // ),
                    //     // const SizedBox(width: 8),
                    //     // TextButton(
                    //     //   child: const Text('LISTEN'),
                    //     //   onPressed: () {
                    //     //     /* ... */
                    //     //   },
                    //     // ),
                    //     // const SizedBox(width: 8),
                    //   ],
                    // ),
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
