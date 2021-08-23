import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_iot/api/api_service.dart';
import 'package:water_iot/model/chemical/chemical.dart';
import 'package:water_iot/model/chemical/khohoachat.dart';
import 'package:intl/intl.dart' as intl;
import 'package:water_iot/model/chemical/congthuchoachat.dart' as DatalistCTHC;
import 'package:water_iot/screen/login/login.dart';
import '../../../ProgressHUD.dart';
import '../../../SharedPref.dart';
import '../../../constants.dart';

class PACPage extends StatefulWidget {
  @override
  _PACPageState createState() => _PACPageState();
}

class _PACPageState extends State<PACPage> {
  bool isApiCallProcess = false;
  DataChemical dataChemical;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formatter = intl.NumberFormat.decimalPattern();

  @override
  void initState() {
    super.initState();
    // loadTitle(position);
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.6,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
              title: Text("PAC"
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
          body: SingleChildScrollView(
            child: new Container(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildItemCongThucHoaChat(),
                    _buildItemKhoHoaChat(),
                    _buildItemHoaChatTieuThu()
                    // _buildItemBieuGiaHoaChat(),
                    // _buildItemChiPhiHoaChat(),
                  ]),
              // _buildItemCongThucHoaChat(),
              // SizedBox(height: 20),
              // _buildItemKhoHoaChat(),
            ),
          )),
    );
  }

  // Widget _buildListView() {
  //   return ListView.builder(
  //       itemCount: dataChemical == null ? 0 : dataChemical.,
  //       itemBuilder: (context, index) {
  //         return _buildItem(bieuGiaHoaChat.dataList[index]);
  //       });
  // }

  Widget _buildItemCongThucHoaChat() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ExpansionTileCard(
        baseColor: Colors.grey[200],
        expandedTextColor: Colors.black,
        // expandedColor: Colors.black,
        // key: cardA,
        // leading: CircleAvatar(
        //     child: Image.asset("assets/images/devs.jpg")),
        // title: Text(
        //     dataChemical == null ? "" : dataChemical.congThucHoaChat.title),
        title: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/img_data.png",
                        fit: BoxFit.contain,
                        height: 35,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: new Text(
                        dataChemical == null ? "" : dataChemical.congThucHoaChat.title,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        // subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
        children: <Widget>[
          Divider(
            thickness: 2.0,
            height: 2.0,
          ),
          InkWell(
            // onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (dataChemical != null)
                  for (var i = 0;
                      i < dataChemical.congThucHoaChat.dataList.length;
                      i++)
                    loadTypeInfo(dataChemical.congThucHoaChat.dataList[i]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loadTypeInfo(DatalistCTHC.DataList congthuchoachat){
    if(congthuchoachat.infoKg != null){
      return  Container(
        width: double.infinity,
        padding:
        EdgeInsets.symmetric(vertical: 00, horizontal: 10),
        margin:
        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(children: <Widget>[
          new Row(
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    congthuchoachat.title,
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
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                              bottom: BorderSide(
                                  width: 1,
                                  color:
                                  Colors.lightBlue.shade900),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: <Widget>[
                              Text("#",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                          const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: <Widget>[
                              Text("1",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 17)),
                            ],
                          ),
                        ),
                      ]),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                              bottom: BorderSide(
                                  width: 1,
                                  color:
                                  Colors.lightBlue.shade900),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Value",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              Text("Unit",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                          const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                  formatter.format(congthuchoachat.infoKg.kg.toInt()),
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 17)),
                              RichText(
                                text: WidgetSpan(
                                  child: Container(
                                    width: 90,
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(
                                            4),
                                        color: Color(0xFF555555)),
                                    child: Text(
                                      "kg",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight:
                                        FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
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
      );
    }else if(congthuchoachat.infoS != null){
      return  Container(
        width: double.infinity,
        padding:
        EdgeInsets.symmetric(vertical: 00, horizontal: 10),
        margin:
        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(children: <Widget>[
          new Row(
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    congthuchoachat.title,
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
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                              bottom: BorderSide(
                                  width: 1,
                                  color:
                                  Colors.lightBlue.shade900),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: <Widget>[
                              Text("#",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                          const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: <Widget>[
                              Text("1",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 17)),
                            ],
                          ),
                        ),
                      ]),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                              bottom: BorderSide(
                                  width: 1,
                                  color:
                                  Colors.lightBlue.shade900),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Value",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              Text("Unit",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                          const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                  formatter.format(congthuchoachat.infoS.s.toInt()),
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 17)),
                              RichText(
                                text: WidgetSpan(
                                  child: Container(
                                    width: 90,
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(
                                            4),
                                        color: Color(0xFF555555)),
                                    child: Text(
                                      "s",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight:
                                        FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
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
      );
    }else if(congthuchoachat.infoL != null){
      return  Container(
        width: double.infinity,
        padding:
        EdgeInsets.symmetric(vertical: 00, horizontal: 10),
        margin:
        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(children: <Widget>[
          new Row(
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    congthuchoachat.title,
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
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                              bottom: BorderSide(
                                  width: 1,
                                  color:
                                  Colors.lightBlue.shade900),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: <Widget>[
                              Text("#",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                          const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: <Widget>[
                              Text("1",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 17)),
                            ],
                          ),
                        ),
                      ]),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                              bottom: BorderSide(
                                  width: 1,
                                  color:
                                  Colors.lightBlue.shade900),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Value",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              Text("Unit",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                          const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                  formatter.format(congthuchoachat.infoL.l.toInt()),
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 17)),
                              RichText(
                                text: WidgetSpan(
                                  child: Container(
                                    width: 90,
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(
                                            4),
                                        color: Color(0xFF555555)),
                                    child: Text(
                                      "l",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight:
                                        FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
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
      );
    }
  }

  Widget _buildItemKhoHoaChat() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ExpansionTileCard(
        baseColor: Colors.grey[200],
        expandedTextColor: Colors.black,
        // expandedColor: Colors.black,
        // key: cardA,
        // leading: CircleAvatar(
        //     child: Image.asset("assets/images/devs.jpg")),
        // title: Text(dataChemical == null ? "" : dataChemical.khoHoaChat.title),
        title: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/img_data.png",
                        fit: BoxFit.contain,
                        height: 35,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: new Text(
                        dataChemical == null ? "" : dataChemical.khoHoaChat.title,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        // subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
        children: <Widget>[
          Divider(
            thickness: 2.0,
            height: 2.0,
          ),
          InkWell(
            // onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (dataChemical != null)
                  for (var i = 0;
                      i < dataChemical.khoHoaChat.dataList.length;
                      i++)
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Column(children: <Widget>[
                        new Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Text(
                                  dataChemical.khoHoaChat.dataList[i].title ==
                                          null
                                      ? ""
                                      : dataChemical
                                          .khoHoaChat.dataList[i].title,
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
                                flex: 1,
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                                            bottom: BorderSide(
                                                width: 1,
                                                color:
                                                    Colors.lightBlue.shade900),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text("#",
                                                style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text("1",
                                                style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontSize: 17)),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                                            bottom: BorderSide(
                                                width: 1,
                                                color:
                                                    Colors.lightBlue.shade900),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text("Value",
                                                style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text("Unit",
                                                style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                      loadTable(dataChemical
                                          .khoHoaChat.dataList[i])
                                      // Container(
                                      //   margin: const EdgeInsets.only(top: 10.0),
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //     MainAxisAlignment.spaceBetween,
                                      //     children: <Widget>[
                                      //       Text(dataChemical.khoHoaChat.dataList[i].info..toString() == null ? "0" : dataChemical.congThucHoaChat.dataList[i].info.kg.toString(),
                                      //           style: TextStyle(
                                      //               color: Colors.grey[800],
                                      //               fontSize: 17)),
                                      //       RichText(
                                      //         text: WidgetSpan(
                                      //           child: Container(
                                      //             width: 90,
                                      //             padding: EdgeInsets.all(6),
                                      //             decoration: BoxDecoration(
                                      //                 borderRadius:
                                      //                 BorderRadius.circular(4),
                                      //                 color: Color(0xFF555555)),
                                      //             child: Text(
                                      //               "kg",
                                      //               textAlign: TextAlign.center,
                                      //               style: TextStyle(
                                      //                 fontWeight: FontWeight.w500,
                                      //                 color: Colors.white,
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
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

  Widget _buildItemHoaChatTieuThu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ExpansionTileCard(
        baseColor: Colors.grey[200],
        expandedTextColor: Colors.black,
        // expandedColor: Colors.black,
        // key: cardA,
        // leading: CircleAvatar(
        //     child: Image.asset("assets/images/devs.jpg")),
        // title:
        //     Text(dataChemical == null ? "" : dataChemical.hoaChatTieuThu.title),
        title: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/img_data.png",
                        fit: BoxFit.contain,
                        height: 35,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: new Text(
                        dataChemical == null ? "" : dataChemical.hoaChatTieuThu.title,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        // subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
        children: <Widget>[
          Divider(
            thickness: 2.0,
            height: 2.0,
          ),
          InkWell(
            // onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (dataChemical != null)
                  for (var i = 0;
                      i < dataChemical.hoaChatTieuThu.dataList.length;
                      i++)
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Column(children: <Widget>[
                        new Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Text(
                                  dataChemical.hoaChatTieuThu.dataList[i]
                                              .title ==
                                          null
                                      ? ""
                                      : dataChemical
                                          .hoaChatTieuThu.dataList[i].title,
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
                                flex: 1,
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                                            bottom: BorderSide(
                                                width: 1,
                                                color:
                                                    Colors.lightBlue.shade900),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text("#",
                                                style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text("1",
                                                style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontSize: 17)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                        const EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text("2",
                                                style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontSize: 17)),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                                            bottom: BorderSide(
                                                width: 1,
                                                color:
                                                    Colors.lightBlue.shade900),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text("Value",
                                                style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text("Unit",
                                                style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                      for (var o = 0;
                                      o < dataChemical.hoaChatTieuThu.dataList[i].info.length;
                                      o++)
                                        Container(
                                          margin:
                                          const EdgeInsets.only(top: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                  dataChemical.hoaChatTieuThu.dataList[i].info[o]
                                                      .value
                                                      .toString() ==
                                                      null
                                                      ? "0"
                                                      : formatter.format(
                                                      dataChemical.hoaChatTieuThu.dataList[i].info[o]
                                                          .value
                                                          .toInt()),
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 17)),
                                              RichText(
                                                text: WidgetSpan(
                                                  child: Container(
                                                    width: 70,
                                                    padding: EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                        color: Color(0xFF555555)),
                                                    child: Text(
                                                      dataChemical.hoaChatTieuThu.dataList[i].info[o].unit,
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
  //
  // Widget _buildItemBieuGiaHoaChat() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
  //     child: ExpansionTileCard(
  //       baseColor: Colors.grey[200],
  //       expandedTextColor: Colors.black,
  //       // expandedColor: Colors.black,
  //       // key: cardA,
  //       // leading: CircleAvatar(
  //       //     child: Image.asset("assets/images/devs.jpg")),
  //       // title:
  //       //     Text(dataChemical == null ? "" : dataChemical.bieuGiaHoaChat.title),
  //       title: Container(
  //         child: Column(
  //           children: <Widget>[
  //             Row(
  //               children: <Widget>[
  //                 new Column(
  //                   children: <Widget>[
  //                     Image.asset(
  //                       "assets/images/img_data.png",
  //                       fit: BoxFit.contain,
  //                       height: 35,
  //                     ),
  //                   ],
  //                 ),
  //                 Expanded(
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 20),
  //                     child: new Text(
  //                       dataChemical == null ? "" : dataChemical.bieuGiaHoaChat.title,
  //                       textAlign: TextAlign.left,
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //       // subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
  //       children: <Widget>[
  //         Divider(
  //           thickness: 2.0,
  //           height: 2.0,
  //         ),
  //         InkWell(
  //           // onTap: () {},
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               if (dataChemical != null)
  //                 for (var i = 0;
  //                     i < dataChemical.bieuGiaHoaChat.dataList.length;
  //                     i++)
  //                   Container(
  //                     width: double.infinity,
  //                     padding:
  //                         EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  //                     margin:
  //                         EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  //                     child: Column(children: <Widget>[
  //                       new Row(
  //                         children: [
  //                           Expanded(
  //                             child: Container(
  //                               child: Text(
  //                                 dataChemical.bieuGiaHoaChat.dataList[i]
  //                                             .title ==
  //                                         null
  //                                     ? ""
  //                                     : dataChemical
  //                                         .bieuGiaHoaChat.dataList[i].title,
  //                                 style: TextStyle(
  //                                   color: textDashboardColor,
  //                                   fontFamily: 'OpenSans',
  //                                   fontSize: 20.0,
  //                                   fontWeight: FontWeight.bold,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       // SizedBox(height: 20),
  //                       Container(
  //                         child: Row(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Expanded(
  //                               flex: 1,
  //                               child: Column(
  //                                   mainAxisSize: MainAxisSize.max,
  //                                   children: <Widget>[
  //                                     Container(
  //                                       decoration: BoxDecoration(
  //                                         border: Border(
  //                                           // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
  //                                           bottom: BorderSide(
  //                                               width: 1,
  //                                               color:
  //                                                   Colors.lightBlue.shade900),
  //                                         ),
  //                                         color: Colors.white,
  //                                       ),
  //                                       child: Row(
  //                                         mainAxisAlignment:
  //                                             MainAxisAlignment.start,
  //                                         children: <Widget>[
  //                                           Text("#",
  //                                               style: TextStyle(
  //                                                   color: Colors.grey[800],
  //                                                   fontWeight: FontWeight.bold,
  //                                                   fontSize: 18)),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                     Container(
  //                                       margin:
  //                                           const EdgeInsets.only(top: 15.0),
  //                                       child: Row(
  //                                         mainAxisAlignment:
  //                                             MainAxisAlignment.start,
  //                                         children: <Widget>[
  //                                           Text("1",
  //                                               style: TextStyle(
  //                                                   color: Colors.grey[800],
  //                                                   fontSize: 17)),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                   ]),
  //                             ),
  //                             Expanded(
  //                               flex: 5,
  //                               child: Column(
  //                                   mainAxisSize: MainAxisSize.max,
  //                                   children: <Widget>[
  //                                     Container(
  //                                       decoration: BoxDecoration(
  //                                         border: Border(
  //                                           // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
  //                                           bottom: BorderSide(
  //                                               width: 1,
  //                                               color:
  //                                                   Colors.lightBlue.shade900),
  //                                         ),
  //                                         color: Colors.white,
  //                                       ),
  //                                       child: Row(
  //                                         mainAxisAlignment:
  //                                             MainAxisAlignment.spaceBetween,
  //                                         children: <Widget>[
  //                                           Text("Value",
  //                                               style: TextStyle(
  //                                                   color: Colors.grey[800],
  //                                                   fontWeight: FontWeight.bold,
  //                                                   fontSize: 18)),
  //                                           Text("Unit",
  //                                               style: TextStyle(
  //                                                   color: Colors.grey[800],
  //                                                   fontWeight: FontWeight.bold,
  //                                                   fontSize: 18)),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                     Container(
  //                                       margin:
  //                                           const EdgeInsets.only(top: 10.0),
  //                                       child: Row(
  //                                         mainAxisAlignment:
  //                                             MainAxisAlignment.spaceBetween,
  //                                         children: <Widget>[
  //                                           Text(
  //                                               dataChemical
  //                                                           .bieuGiaHoaChat
  //                                                           .dataList[i]
  //                                                           .info
  //                                                           .value
  //                                                           .toString() ==
  //                                                       null
  //                                                   ? "0"
  //                                                   : formatter.format(
  //                                                       dataChemical
  //                                                           .bieuGiaHoaChat
  //                                                           .dataList[i]
  //                                                           .info
  //                                                           .value
  //                                                           .toInt()),
  //                                               style: TextStyle(
  //                                                   color: Colors.grey[800],
  //                                                   fontSize: 17)),
  //                                           RichText(
  //                                             text: WidgetSpan(
  //                                               child: Container(
  //                                                 width: 90,
  //                                                 padding: EdgeInsets.all(6),
  //                                                 decoration: BoxDecoration(
  //                                                     borderRadius:
  //                                                         BorderRadius.circular(
  //                                                             4),
  //                                                     color: Color(0xFF555555)),
  //                                                 child: Text(
  //                                                   "kg",
  //                                                   textAlign: TextAlign.center,
  //                                                   style: TextStyle(
  //                                                     fontWeight:
  //                                                         FontWeight.w500,
  //                                                     color: Colors.white,
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                   ]),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ]),
  //                   ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildItemChiPhiHoaChat() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
  //     child: ExpansionTileCard(
  //       baseColor: Colors.grey[200],
  //       expandedTextColor: Colors.black,
  //       // expandedColor: Colors.black,
  //       // key: cardA,
  //       // leading: CircleAvatar(
  //       //     child: Image.asset("assets/images/devs.jpg")),
  //       // title:
  //       //     Text(dataChemical == null ? "" : dataChemical.chiPhiHoaChat.title),
  //       title: Container(
  //         child: Column(
  //           children: <Widget>[
  //             Row(
  //               children: <Widget>[
  //                 new Column(
  //                   children: <Widget>[
  //                     Image.asset(
  //                       "assets/images/img_data.png",
  //                       fit: BoxFit.contain,
  //                       height: 35,
  //                     ),
  //                   ],
  //                 ),
  //                 Expanded(
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 20),
  //                     child: new Text(
  //                       dataChemical == null ? "" : dataChemical.chiPhiHoaChat.title,
  //                       textAlign: TextAlign.left,
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //       // subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
  //       children: <Widget>[
  //         Divider(
  //           thickness: 2.0,
  //           height: 2.0,
  //         ),
  //         InkWell(
  //           // onTap: () {},
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               if (dataChemical != null)
  //                 for (var i = 0;
  //                     i < dataChemical.chiPhiHoaChat.dataList.length;
  //                     i++)
  //                   Container(
  //                     width: double.infinity,
  //                     padding:
  //                         EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  //                     margin:
  //                         EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  //                     child: Column(children: <Widget>[
  //                       new Row(
  //                         children: [
  //                           Expanded(
  //                             child: Container(
  //                               child: Text(
  //                                 dataChemical.chiPhiHoaChat.dataList[i]
  //                                             .title ==
  //                                         null
  //                                     ? ""
  //                                     : dataChemical
  //                                         .chiPhiHoaChat.dataList[i].title,
  //                                 style: TextStyle(
  //                                   color: textDashboardColor,
  //                                   fontFamily: 'OpenSans',
  //                                   fontSize: 20.0,
  //                                   fontWeight: FontWeight.bold,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       SizedBox(height: 20),
  //                       Container(
  //                         child: Row(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Expanded(
  //                               flex: 1,
  //                               child: Column(
  //                                   mainAxisSize: MainAxisSize.max,
  //                                   children: <Widget>[
  //                                     Container(
  //                                       decoration: BoxDecoration(
  //                                         border: Border(
  //                                           // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
  //                                           bottom: BorderSide(
  //                                               width: 1,
  //                                               color:
  //                                                   Colors.lightBlue.shade900),
  //                                         ),
  //                                         color: Colors.white,
  //                                       ),
  //                                       child: Row(
  //                                         mainAxisAlignment:
  //                                             MainAxisAlignment.start,
  //                                         children: <Widget>[
  //                                           Text("#",
  //                                               style: TextStyle(
  //                                                   color: Colors.grey[800],
  //                                                   fontWeight: FontWeight.bold,
  //                                                   fontSize: 18)),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                     Container(
  //                                       margin:
  //                                           const EdgeInsets.only(top: 15.0),
  //                                       child: Row(
  //                                         mainAxisAlignment:
  //                                             MainAxisAlignment.start,
  //                                         children: <Widget>[
  //                                           Text("1",
  //                                               style: TextStyle(
  //                                                   color: Colors.grey[800],
  //                                                   fontSize: 17)),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                   ]),
  //                             ),
  //                             Expanded(
  //                               flex: 5,
  //                               child: Column(
  //                                   mainAxisSize: MainAxisSize.max,
  //                                   children: <Widget>[
  //                                     Container(
  //                                       decoration: BoxDecoration(
  //                                         border: Border(
  //                                           // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
  //                                           bottom: BorderSide(
  //                                               width: 1,
  //                                               color:
  //                                                   Colors.lightBlue.shade900),
  //                                         ),
  //                                         color: Colors.white,
  //                                       ),
  //                                       child: Row(
  //                                         mainAxisAlignment:
  //                                             MainAxisAlignment.spaceBetween,
  //                                         children: <Widget>[
  //                                           Text("Value",
  //                                               style: TextStyle(
  //                                                   color: Colors.grey[800],
  //                                                   fontWeight: FontWeight.bold,
  //                                                   fontSize: 18)),
  //                                           Text("Unit",
  //                                               style: TextStyle(
  //                                                   color: Colors.grey[800],
  //                                                   fontWeight: FontWeight.bold,
  //                                                   fontSize: 18)),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                     Container(
  //                                       margin:
  //                                           const EdgeInsets.only(top: 10.0),
  //                                       child: Row(
  //                                         mainAxisAlignment:
  //                                             MainAxisAlignment.spaceBetween,
  //                                         children: <Widget>[
  //                                           Text(
  //                                               dataChemical
  //                                                           .chiPhiHoaChat
  //                                                           .dataList[i]
  //                                                           .info
  //                                                           .value
  //                                                           .toString() ==
  //                                                       null
  //                                                   ? "0"
  //                                                   : formatter.format(
  //                                                       dataChemical
  //                                                           .chiPhiHoaChat
  //                                                           .dataList[i]
  //                                                           .info
  //                                                           .value
  //                                                           .toInt()),
  //                                               style: TextStyle(
  //                                                   color: Colors.grey[800],
  //                                                   fontSize: 17)),
  //                                           RichText(
  //                                             text: WidgetSpan(
  //                                               child: Container(
  //                                                 width: 90,
  //                                                 padding: EdgeInsets.all(6),
  //                                                 decoration: BoxDecoration(
  //                                                     borderRadius:
  //                                                         BorderRadius.circular(
  //                                                             4),
  //                                                     color: Color(0xFF555555)),
  //                                                 child: Text(
  //                                                   "kg",
  //                                                   textAlign: TextAlign.center,
  //                                                   style: TextStyle(
  //                                                     fontWeight:
  //                                                         FontWeight.w500,
  //                                                     color: Colors.white,
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                   ]),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ]),
  //                   ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget loadTable(DataList dataList) {
    if (dataList.infoBG != null) {
      return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(formatter.format(dataList.infoBG.value.toInt()),
                style: TextStyle(color: Colors.grey[800], fontSize: 17)),
            RichText(
              text: WidgetSpan(
                child: Container(
                  width: 70,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xFF555555)),
                  child: Text(
                    dataList.unit,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (dataList.infoKLDN != null) {
      return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(formatter.format(dataList.infoKLDN.khoiLuongDaNhap.toInt()),
                style: TextStyle(color: Colors.grey[800], fontSize: 17)),
            RichText(
              text: WidgetSpan(
                child: Container(
                  width: 50,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xFF555555)),
                  child: Text(
                    dataList.unit,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (dataList.infoKLCL != null) {
      return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(formatter.format(dataList.infoKLCL.khoiLuongConLai.toInt()),
                style: TextStyle(color: Colors.grey[800], fontSize: 17)),
            RichText(
              text: WidgetSpan(
                child: Container(
                  width: 50,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xFF555555)),
                  child: Text(
                    dataList.unit,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  loadData() async {
    setState(() {
      isApiCallProcess = true;
    });
    APIService apiService = new APIService();
    apiService.getListChemical(factoryLocal.factoryId.toString()).then((value) {
      setState(() {
        isApiCallProcess = false;
      });
      if (value.statusCode == 200) {
        dataChemical = value.data.pac;
      } else {
        if (value.errorCode == 401) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoginPage();
              },
            ),
            (route) => false,
          );
        }
      }
    }).catchError((onError) {
      setState(() {
        isApiCallProcess = false;
      });
      final snackBar = SnackBar(content: Text("Lỗi server"));
      scaffoldKey.currentState.showSnackBar(snackBar);
    });
  }
}
