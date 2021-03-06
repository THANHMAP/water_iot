import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_iot/model/flowmeter/luuluonghaophi.dart';
import 'package:water_iot/screen/chart/diennang/chiphidien.dart';
import 'package:water_iot/screen/chart/diennang/detaildiennang.dart';
import 'package:water_iot/screen/chart/diennang/diennangtieuthu.dart';
import 'package:water_iot/screen/chart/flowmeter/doanhsobannuoc.dart';
import 'package:water_iot/screen/chart/flowmeter/luuluongbanra.dart';
import 'package:water_iot/screen/chart/flowmeter/luuluongdauvao.dart';
import 'package:water_iot/screen/chart/flowmeter/luuluonghaophi.dart';
import 'package:water_iot/screen/device/MotorDetail.dart';

import '../../../SharedPref.dart';
import '../../../constants.dart';


class DoanhThuNuocPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DoanhThuNuocPageState();
}

class _DoanhThuNuocPageState extends State {

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
            "Doanh Thu Nước",
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
                      SizedBox(height: 20),
                      Container(
                        child: Column(children: <Widget>[
                          InkWell(
                            child: Container(
                              width: double.infinity,
                              height: 65,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context)
                                          .hintColor
                                          .withOpacity(0.2),
                                      offset: Offset(0, 10),
                                      blurRadius: 20)
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                            "assets/images/img_data.png",
                                            fit: BoxFit.contain,
                                            height: 35,
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
                                          child: Center(
                                            child: Text(
                                              "Lưu Lượng Đầu Vào",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: textDashboardColor,
                                                fontFamily: 'OpenSans',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
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
                                  MaterialPageRoute(
                                    builder: (context) => LuuLuongDauVaoPage(),
                                  ));
                            },
                          ),
                          SizedBox(height: 13),
                          InkWell(
                            child: Container(
                              width: double.infinity,
                              height: 65,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context)
                                          .hintColor
                                          .withOpacity(0.2),
                                      offset: Offset(0, 10),
                                      blurRadius: 20)
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: Image.asset(
                                          "assets/images/img_data.png",
                                          fit: BoxFit.contain,
                                          height: 35,
                                        ),
                                        // child: Image.asset(
                                        //   "assets/images/ic_factory.png",
                                        //   fit: BoxFit.contain,
                                        // ),
                                      ),
                                      Expanded(
                                        flex: 50,
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              "Lưu Lượng Hao Phí",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: textDashboardColor,
                                                fontFamily: 'OpenSans',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
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
                                  MaterialPageRoute(
                                    builder: (context) => LuuLuongHaoPhiPage(),
                                  ));
                            },
                          ),
                          SizedBox(height: 13),
                          InkWell(
                            child: Container(
                              width: double.infinity,
                              height: 70,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context)
                                          .hintColor
                                          .withOpacity(0.2),
                                      offset: Offset(0, 10),
                                      blurRadius: 20)
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            "assets/images/img_data.png",
                                            fit: BoxFit.contain,
                                            height: 35,
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
                                          child: Center(
                                            child: Text(
                                              "Lưu Lượng Bán Ra",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: textDashboardColor,
                                                fontFamily: 'OpenSans',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
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
                                  MaterialPageRoute(
                                    builder: (context) => LuuLuongBanRaPage(),
                                  ));
                            },
                          ),
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

  Widget _buildLuuLuongDauVao() {
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
                MaterialPageRoute(
                  builder: (context) => LuuLuongDauVaoPage(),
                ));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70,
                color: HexColor("#e91e63"),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        // Expanded(
                        //   flex: 1,
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     // color: Colors.amber,
                        //     // height: 100,
                        //     child: Align(
                        //       alignment: Alignment.topRight,
                        //       child: SvgPicture.asset(
                        //         "assets/images/ic_pump.svg",
                        //         color: Color(0xFFF4F5F8),
                        //         height: 70,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Text(
                                        "Lưu Lượng Đầu Vào",
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

  Widget _buildLuuLuongHaoPhi() {
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
                MaterialPageRoute(
                  builder: (context) => LuuLuongHaoPhiPage(),
                ));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70,
                color: HexColor("#4caf50"),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        // Expanded(
                        //   flex: 1,
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     // color: Colors.amber,
                        //     // height: 100,
                        //     child: Align(
                        //       alignment: Alignment.topRight,
                        //       child: SvgPicture.asset(
                        //         "assets/images/ic_pump.svg",
                        //         color: Color(0xFFF4F5F8),
                        //         height: 70,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Text(
                                        "Lưu Lương Hao Phí",
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

  // Widget _buildDoanSoBanNuoc() {
  //   return Padding(
  //     padding: const EdgeInsets.all(0),
  //     child: Card(
  //       clipBehavior: Clip.antiAlias,
  //       elevation: 16,
  //       shape:
  //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  //       child: InkWell(
  //         onTap: () {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => DoanhSoBanNuocPage(),
  //               ));
  //         },
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Container(
  //               height: 70,
  //               color: HexColor("#009688"),
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
  //                                       "Doanh Số Bán Nước",
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

  Widget _buildLuuLuongBanRa() {
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
                MaterialPageRoute(
                  builder: (context) => LuuLuongBanRaPage(),
                ));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70,
                color: HexColor("#009688"),
                width: double.infinity,
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      children: [
                        // Expanded(
                        //   flex: 1,
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     // color: Colors.amber,
                        //     // height: 100,
                        //     child: Align(
                        //       alignment: Alignment.topRight,
                        //       child: SvgPicture.asset(
                        //         "assets/images/ic_pump.svg",
                        //         color: Color(0xFFF4F5F8),
                        //         height: 70,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      // color: Colors.amber,
                                      child: Text(
                                        "Lưu Lượng Bán Ra",
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
}
