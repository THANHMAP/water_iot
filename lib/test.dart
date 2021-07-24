import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
          title: Text(
            "FACTORY",
            style: TextStyle(color: mTexHeadLoginColor),
          ),
          centerTitle: true),
      body: Stack(
        children: <Widget>[
          _buildCard(),
          // ListView(
          //   children: <Widget>[_buildCard(), _buildCard2()],
          // ),
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
          onTap: () {
            // Navigator.pushAndRemoveUntil(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => MainPage(0),
            //   ),
            //       (route) => false,
            // );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(children: <Widget>[
                  new Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                              bottom: BorderSide(
                                  width: 1, color: Colors.lightBlue.shade900),
                            ),
                            color: Colors.white,
                          ),
                          child: Text(
                            "Mực nước LT06",
                            style: TextStyle(
                              color: textDashboardColor,
                              fontFamily: 'OpenSans',
                              fontSize: 20.0,
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
                  SizedBox(height: 20),
                  new Row(
                    children: [
                      Text("Status: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800],
                                    fontSize: 18)),
                      Text("Value",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 18)),
                      // Expanded(
                      //   child: Container(
                      //     child: Text("Value",
                      //         style: TextStyle(
                      //             color: Colors.grey[800],
                      //             fontSize: 18)),
                      //
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 10),
                  new Row(
                    children: [
                      Text("Operating Status: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                              fontSize: 18)),
                      Text("Value",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 18)),
                      // Expanded(
                      //   child: Container(
                      //     child: Text("Value",
                      //         style: TextStyle(
                      //             color: Colors.grey[800],
                      //             fontSize: 18)),
                      //
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 10),
                  new Row(
                    children: [
                      Text("Total OVL: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                              fontSize: 18)),
                      Text("Value",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 18)),
                      // Expanded(
                      //   child: Container(
                      //     child: Text("Value",
                      //         style: TextStyle(
                      //             color: Colors.grey[800],
                      //             fontSize: 18)),
                      //
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 10),
                  new Row(
                    children: [
                      Text("Total NRF: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                              fontSize: 18)),
                      Text("Value",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 18)),
                      // Expanded(
                      //   child: Container(
                      //     child: Text("Value",
                      //         style: TextStyle(
                      //             color: Colors.grey[800],
                      //             fontSize: 18)),
                      //
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 10),
                  new Row(
                    children: [
                      Text("Total RT: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                              fontSize: 18)),
                      Text("Value",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 18)),
                      // Expanded(
                      //   child: Container(
                      //     child: Text("Value",
                      //         style: TextStyle(
                      //             color: Colors.grey[800],
                      //             fontSize: 18)),
                      //
                      //   ),
                      // ),
                    ],
                  ),
                  // Container(
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Expanded(
                  //         child: Column(
                  //             mainAxisSize: MainAxisSize.max,
                  //             children: <Widget>[
                  //               Container(
                  //                 decoration: BoxDecoration(
                  //                   border: Border(
                  //                     // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                  //                     bottom: BorderSide(width: 1, color: Colors.lightBlue.shade900),
                  //                   ),
                  //                   color: Colors.white,
                  //                 ),
                  //                 child: Row(
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceBetween,
                  //                   children: <Widget>[
                  //                     Text("Value",
                  //                         style: TextStyle(
                  //                             color: Colors.grey[800],
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 18)),
                  //                     Text("Unit",
                  //                         style: TextStyle(
                  //                             color: Colors.grey[800],
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 18)),
                  //                   ],
                  //                 ),
                  //               ),
                  //               SizedBox(height: 10),
                  //               Container(
                  //                 child: Row(
                  //                   mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //                   children: <Widget>[
                  //                     Text("Value",
                  //                         style: TextStyle(
                  //                             color: Colors.grey[800],
                  //                             fontSize: 17)),
                  //                     Text("Unit",
                  //                         style: TextStyle(
                  //                             color: Colors.grey[800],
                  //                             fontSize: 17)),
                  //                   ],
                  //                 ),
                  //               ),
                  //               SizedBox(height: 10),
                  //               Container(
                  //                 child: Row(
                  //                   mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //                   children: <Widget>[
                  //                     Text("Value",
                  //                         style: TextStyle(
                  //                             color: Colors.grey[800],
                  //                             fontSize: 17)),
                  //                     Text("Unit",
                  //                         style: TextStyle(
                  //                             color: Colors.grey[800],
                  //                             fontSize: 17)),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ]),
                  //       ),
                  //       Expanded(
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.max,
                  //             children: <Widget>[
                  //               Container(
                  //                 decoration: BoxDecoration(
                  //                   border: Border(
                  //                     // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                  //                     bottom: BorderSide(width: 1, color: Colors.lightBlue.shade900),
                  //                   ),
                  //                   color: Colors.white,
                  //                 ),
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.end,
                  //                   children: <Widget>[
                  //                     Text("Set Point",
                  //                         style: TextStyle(
                  //                             color: Colors.grey[800],
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 18)),
                  //                   ],
                  //                 ),
                  //               ),
                  //               SizedBox(height: 10),
                  //               Container(
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.end,
                  //                   children: <Widget>[
                  //                     Text("Set Point",
                  //                         style: TextStyle(
                  //                             color: Colors.grey[800],
                  //                             fontSize: 17)),
                  //                   ],
                  //                 ),
                  //               ),
                  //               SizedBox(height: 10),
                  //               Container(
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.end,
                  //                   children: <Widget>[
                  //                     Text("Set Point",
                  //                         style: TextStyle(
                  //                             color: Colors.grey[800],
                  //                             fontSize: 17)),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ]
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ]),
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
