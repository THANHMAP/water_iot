import 'package:cached_network_image/cached_network_image.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
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
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
          title: Text(
            "FACTORY",
            style: TextStyle(color: mTexHeadLoginColor),
          ),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: ExpansionTileCard(
          baseColor: Colors.grey[200],
          expandedTextColor: Colors.black,
          // expandedColor: Colors.black,
          // key: cardA,
          // leading: CircleAvatar(
          //     child: Image.asset("assets/images/devs.jpg")),
          title: Text("Flutter Dev's"),
          subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
          children: <Widget>[
            Divider(
              thickness: 2.0,
              height: 2.0,
            ),
             InkWell(
              onTap: () {},
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
                                "dataMotor.name  + dataMotor.symbol",
                                style: TextStyle(
                                  color: textDashboardColor,
                                  fontFamily: 'OpenSans',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child:
                              Column(mainAxisSize: MainAxisSize.max, children: <
                                  Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 2,
                                        child: Text("Status: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[800],
                                                fontSize: 18)),
                                      ),
                                      Flexible(
                                          fit: FlexFit.tight,
                                          flex: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              // color:
                                              // HexColor(dataMotor.statusColor),
                                              boxShadow: [
                                                BoxShadow(
                                                  color:
                                                  Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 3,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 5),
                                              child: Center(
                                                child: Text("dataMotor.statusName",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.grey[800],
                                                        fontSize: 18)),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 2,
                                        child: Text("Operating Status: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[800],
                                                fontSize: 18)),
                                      ),
                                      Flexible(
                                          fit: FlexFit.tight,
                                          flex: 1,
                                          child: Container(
                                            width: 30,
                                            decoration: BoxDecoration(
                                              // color: HexColor(
                                              //     dataMotor.operationStatusColor),
                                              boxShadow: [
                                                BoxShadow(
                                                  color:
                                                  Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 3,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              // border: Border.all(
                                              //   color: Colors.red,
                                              //   width: 1,
                                              // )
                                            ),
                                            child: Padding(
                                              padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 5),
                                              child: Center(
                                                child: Text(
                                                    "dataMotor.operationStatusName",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.grey[800],
                                                        fontSize: 18)),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 2,
                                        child: Text("Total OVL: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[800],
                                                fontSize: 18)),
                                      ),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 1,
                                        child: Text("dataMotor.totalovl.toString()",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 18)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 2,
                                        child: Text("Total NRF: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[800],
                                                fontSize: 18)),
                                      ),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 1,
                                        child: Text("dataMotor.totalnrf.toString()",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 18)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 2,
                                        child: Text("Total RT: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[800],
                                                fontSize: 18)),
                                      ),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 1,
                                        child: Text("dataMotor.totalrt.toString()",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 18)),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildItem(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
      child: ExpansionTileCard(
        baseColor: Colors.grey[200],
        expandedTextColor: Colors.black,
        // expandedColor: Colors.black,
        // key: cardA,
        // leading: CircleAvatar(
        //     child: Image.asset("assets/images/devs.jpg")),
        title: Text("Flutter Dev's"),
        subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
        children: <Widget>[
          Divider(
            thickness: 2.0,
            height: 2.0,
          ),
          InkWell(
            onTap: () {},
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
                              "dataMotor.name  + dataMotor.symbol",
                              style: TextStyle(
                                color: textDashboardColor,
                                fontFamily: 'OpenSans',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child:
                            Column(mainAxisSize: MainAxisSize.max, children: <
                                Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      fit: FlexFit.tight,
                                      flex: 2,
                                      child: Text("Status: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[800],
                                              fontSize: 18)),
                                    ),
                                    Flexible(
                                        fit: FlexFit.tight,
                                        flex: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            // color:
                                            // HexColor(dataMotor.statusColor),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                Colors.grey.withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 3,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(5, 5, 5, 5),
                                            child: Center(
                                              child: Text("dataMotor.statusName",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.grey[800],
                                                      fontSize: 18)),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      fit: FlexFit.tight,
                                      flex: 2,
                                      child: Text("Operating Status: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[800],
                                              fontSize: 18)),
                                    ),
                                    Flexible(
                                        fit: FlexFit.tight,
                                        flex: 1,
                                        child: Container(
                                          width: 30,
                                          decoration: BoxDecoration(
                                            // color: HexColor(
                                            //     dataMotor.operationStatusColor),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                Colors.grey.withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 3,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            // border: Border.all(
                                            //   color: Colors.red,
                                            //   width: 1,
                                            // )
                                          ),
                                          child: Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(5, 5, 5, 5),
                                            child: Center(
                                              child: Text(
                                                  "dataMotor.operationStatusName",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.grey[800],
                                                      fontSize: 18)),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      fit: FlexFit.tight,
                                      flex: 2,
                                      child: Text("Total OVL: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[800],
                                              fontSize: 18)),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      flex: 1,
                                      child: Text("dataMotor.totalovl.toString()",
                                          style: TextStyle(
                                              color: Colors.grey[800],
                                              fontSize: 18)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      fit: FlexFit.tight,
                                      flex: 2,
                                      child: Text("Total NRF: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[800],
                                              fontSize: 18)),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      flex: 1,
                                      child: Text("dataMotor.totalnrf.toString()",
                                          style: TextStyle(
                                              color: Colors.grey[800],
                                              fontSize: 18)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      fit: FlexFit.tight,
                                      flex: 2,
                                      child: Text("Total RT: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[800],
                                              fontSize: 18)),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      flex: 1,
                                      child: Text("dataMotor.totalrt.toString()",
                                          style: TextStyle(
                                              color: Colors.grey[800],
                                              fontSize: 18)),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
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
