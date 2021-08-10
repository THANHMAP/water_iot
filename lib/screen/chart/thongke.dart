import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_iot/screen/chart/diennang/diennang.dart';
import 'package:water_iot/screen/chart/flowmeter/doanhthunuoc.dart';
import 'package:water_iot/screen/chart/hoachat/hoachat.dart';

import '../../SharedPref.dart';
import '../../constants.dart';

class ScatterChartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScatterChartPageState();
}

class _ScatterChartPageState extends State {
  bool _expanded = false;
  var _test = "Full Screen";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
          title: Text(
            "Thống Kê",
            // style: TextStyle(color: mTexHeadLoginColor),
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
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg_app.png"),
                  fit: BoxFit.cover)),
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
                          factoryLocal.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF070707),
                            fontFamily: 'OpenSans',
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      // SizedBox(height: 10),
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
                      SizedBox(height: 20),
                      Container(
                        child: Column(children: <Widget>[

                          InkWell(
                            child: Container(
                              width: double.infinity,
                              height: 65,
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).hintColor.withOpacity(0.2),
                                      offset: Offset(0, 10),
                                      blurRadius: 20)
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: SvgPicture.asset(
                                          "assets/images/ic_process.svg",
                                          color: Color(0xFF556DD3),
                                          fit: BoxFit.contain,
                                          height: 40,
                                        ),
                                        // child: Image.asset(
                                        //   "assets/images/ic_factory.png",
                                        //   fit: BoxFit.contain,
                                        // ),
                                      ),
                                      Expanded(
                                        flex: 50,
                                        child: Container(
                                          margin: new EdgeInsets.symmetric(horizontal: 50.0),
                                          child: Text(
                                            'Điện Năng',
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
                                      Expanded(
                                        flex: 3,
                                        child: Image.asset(
                                          "assets/images/ic_arrow.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DienNangPage()),
                              );
                            },
                          ),
                          SizedBox(height: 13),
                          InkWell(
                            child: Container(
                              width: double.infinity,
                              height: 65,
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).hintColor.withOpacity(0.2),
                                      offset: Offset(0, 10),
                                      blurRadius: 20)
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: SvgPicture.asset(
                                          "assets/images/ic_chemical.svg",
                                          color: Color(0xFF556DD3),
                                          fit: BoxFit.contain,
                                          height: 40,
                                        ),
                                        // child: Image.asset(
                                        //   "assets/images/ic_factory.png",
                                        //   fit: BoxFit.contain,
                                        // ),
                                      ),
                                      Expanded(
                                        flex: 50,
                                        child: Container(
                                          margin: new EdgeInsets.symmetric(horizontal: 50.0),
                                          child: Text(
                                            'Hóa Chất',
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
                                      Expanded(
                                        flex: 3,
                                        child: Image.asset(
                                          "assets/images/ic_arrow.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HoaChatPage()),
                              );
                            },
                          ),
                          SizedBox(height: 13),
                          InkWell(
                            child: Container(
                              width: double.infinity,
                              height: 65,
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).hintColor.withOpacity(0.2),
                                      offset: Offset(0, 10),
                                      blurRadius: 20)
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: SvgPicture.asset(
                                            "assets/images/ic_pump.svg",
                                            color: Color(0xFF556DD3),
                                            fit: BoxFit.contain,
                                            height: 40,
                                          ),
                                        ),

                                        // child: Image.asset(
                                        //   "assets/images/ic_factory.png",
                                        //   fit: BoxFit.contain,
                                        // ),
                                      ),
                                      Expanded(
                                        flex: 50,
                                        child: Container(
                                          margin: new EdgeInsets.symmetric(horizontal: 50.0),
                                          child: Text(
                                            'Lưu Lượng',
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
                                      Expanded(
                                        flex: 3,
                                        child: Image.asset(
                                          "assets/images/ic_arrow.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DoanhThuNuocPage()),
                              );
                            },
                          ),
                          // _buildDienNang(),
                          // _buildHoaChat(),
                          // _buildDoangThuNuoc(),
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
    );
  }

  Widget _buildDienNang() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DienNangPage()),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 90,
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
                          flex: 1,
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
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Điện Năng",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // new Row(
                              //   children: [
                              //     Expanded(
                              //       child: Container(
                              //         margin: const EdgeInsets.only(top: 10.0),
                              //         alignment: Alignment.center,
                              //         // color: Colors.amber,
                              //         child: Image.asset(
                              //           "assets/images/ic_arrow_down.png",
                              //           height: 10,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
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

  Widget _buildHoaChat() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HoaChatPage()),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 90,
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
                          flex: 1,
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
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Hóa Chất",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // new Row(
                              //   children: [
                              //     Expanded(
                              //       child: Container(
                              //         margin: const EdgeInsets.only(top: 10.0),
                              //         alignment: Alignment.center,
                              //         // color: Colors.amber,
                              //         child: Image.asset(
                              //           "assets/images/ic_arrow_down.png",
                              //           height: 10,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
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

  Widget _buildDoangThuNuoc() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DoanhThuNuocPage()),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 90,
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
                          flex: 1,
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
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 20),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Lưu Lượng",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // new Row(
                              //   children: [
                              //     Expanded(
                              //       child: Container(
                              //         margin: const EdgeInsets.only(top: 10.0),
                              //         alignment: Alignment.center,
                              //         // color: Colors.amber,
                              //         child: Image.asset(
                              //           "assets/images/ic_arrow_down.png",
                              //           height: 10,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
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
// Widget _buildDienNang() {
//   return Padding(
//     padding: const EdgeInsets.all(0),
//     child: Card(
//       clipBehavior: Clip.antiAlias,
//       elevation: 16,
//       shape:
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DienNangPage(),
//               ));
//         },
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               height: 70,
//               color: Color(0xFF556DD3),
//               width: double.infinity,
//               // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
//               // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   new Row(
//                     children: [
//                       // Expanded(
//                       //   flex: 1,
//                       //   child: Container(
//                       //     alignment: Alignment.center,
//                       //     // color: Colors.amber,
//                       //     // height: 100,
//                       //     child: Align(
//                       //       alignment: Alignment.topRight,
//                       //       child: SvgPicture.asset(
//                       //         "assets/images/ic_pump.svg",
//                       //         color: Color(0xFFF4F5F8),
//                       //         height: 70,
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                       Expanded(
//                         flex: 2,
//                         child: Column(
//                           children: <Widget>[
//                             new Row(
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     // color: Colors.amber,
//                                     child: Text(
//                                       "Điện Năng",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 30),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             // new Row(
//                             //   children: [
//                             //     Expanded(
//                             //       child: Container(
//                             //         margin: const EdgeInsets.only(top: 10.0),
//                             //         alignment: Alignment.center,
//                             //         // color: Colors.amber,
//                             //         child: Image.asset(
//                             //           "assets/images/ic_arrow_down.png",
//                             //           height: 10,
//                             //         ),
//                             //       ),
//                             //     ),
//                             //   ],
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//
//             // Row(
//
//             // ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// Widget _buildHoaChat() {
//   return Padding(
//     padding: const EdgeInsets.all(0),
//     child: Card(
//       clipBehavior: Clip.antiAlias,
//       elevation: 16,
//       shape:
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => HoaChatPage(),
//               ));
//         },
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               height: 70,
//               color: Color(0xFF556DD3),
//               width: double.infinity,
//               // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
//               // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   new Row(
//                     children: [
//                       // Expanded(
//                       //   flex: 1,
//                       //   child: Container(
//                       //     alignment: Alignment.center,
//                       //     // color: Colors.amber,
//                       //     // height: 100,
//                       //     child: Align(
//                       //       alignment: Alignment.topRight,
//                       //       child: SvgPicture.asset(
//                       //         "assets/images/ic_pump.svg",
//                       //         color: Color(0xFFF4F5F8),
//                       //         height: 70,
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                       Expanded(
//                         flex: 2,
//                         child: Column(
//                           children: <Widget>[
//                             new Row(
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     // color: Colors.amber,
//                                     child: Text(
//                                       "Hóa Chất",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 30),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             // new Row(
//                             //   children: [
//                             //     Expanded(
//                             //       child: Container(
//                             //         margin: const EdgeInsets.only(top: 10.0),
//                             //         alignment: Alignment.center,
//                             //         // color: Colors.amber,
//                             //         child: Image.asset(
//                             //           "assets/images/ic_arrow_down.png",
//                             //           height: 10,
//                             //         ),
//                             //       ),
//                             //     ),
//                             //   ],
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//
//             // Row(
//
//             // ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// Widget _buildDoangThuNuoc() {
//   return Padding(
//     padding: const EdgeInsets.all(0),
//     child: Card(
//       clipBehavior: Clip.antiAlias,
//       elevation: 16,
//       shape:
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DoanhThuNuocPage(),
//               ));
//         },
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               height: 70,
//               color: Color(0xFF556DD3),
//               width: double.infinity,
//               // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
//               // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   new Row(
//                     children: [
//                       // Expanded(
//                       //   flex: 1,
//                       //   child: Container(
//                       //     alignment: Alignment.center,
//                       //     // color: Colors.amber,
//                       //     // height: 100,
//                       //     child: Align(
//                       //       alignment: Alignment.topRight,
//                       //       child: SvgPicture.asset(
//                       //         "assets/images/ic_pump.svg",
//                       //         color: Color(0xFFF4F5F8),
//                       //         height: 70,
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                       Expanded(
//                         flex: 2,
//                         child: Column(
//                           children: <Widget>[
//                             new Row(
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     // color: Colors.amber,
//                                     child: Text(
//                                       "Doanh Thu Nước",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 30),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             // new Row(
//                             //   children: [
//                             //     Expanded(
//                             //       child: Container(
//                             //         margin: const EdgeInsets.only(top: 10.0),
//                             //         alignment: Alignment.center,
//                             //         // color: Colors.amber,
//                             //         child: Image.asset(
//                             //           "assets/images/ic_arrow_down.png",
//                             //           height: 10,
//                             //         ),
//                             //       ),
//                             //     ),
//                             //   ],
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//
//             // Row(
//
//             // ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
}
