import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constants.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MapPageState();
}

class _MapPageState extends State {
  static final LatLng _kMapCenter =
      LatLng(19.018255973653343, 72.84793849278007);
  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
  CameraPosition vegasPosition =
      CameraPosition(target: LatLng(36.0953103, -115.1992098), zoom: 10);

  // Widget _buildGoogleMap(BuildContext context) {
  //   return Positioned(
  //     left: 50,
  //     right: 30,
  //     top: 100,
  //     bottom: 300,
  //     child: Container(
  //       child: GoogleMap(
  //         mapType: MapType.normal,
  //         // initialCameraPosition: vegasPosition,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GOOGLE MAP",
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
              Navigator.pop(context);
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
            }),
      ),
      body: Container(
        child: new Container(
          child: new Column(
            children: <Widget>[
              // Container(
              //   width: double.infinity,
              //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              //   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Theme.of(context).primaryColor,
              //     boxShadow: [
              //       BoxShadow(
              //           color: Theme.of(context).hintColor.withOpacity(0.2),
              //           offset: Offset(0, 10),
              //           blurRadius: 10)
              //     ],
              //   ),
              //   child: Column(
              //     children: <Widget>[
              //       Container(
              //         height: 200,
              //         width: MediaQuery.of(context).size.width,
              //         child: GoogleMap(
              //           initialCameraPosition: vegasPosition,
              //           onMapCreated: (GoogleMapController controller) {},
              //           myLocationButtonEnabled: false,
              //           tiltGesturesEnabled: false,
              //           // polygons: GoogleMapOptions(
              //           //     myLocationEnabled:true
              //           //   //there is a lot more options you can add here
              //           // ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SingleChildScrollView(
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      _buildCard2(),
                    ],
                  ),
                ),
              ),
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
                        Expanded(
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: GoogleMap(
                              initialCameraPosition: vegasPosition,
                              onMapCreated: (GoogleMapController controller) {},
                              myLocationButtonEnabled: false,
                              tiltGesturesEnabled: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 13),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  children: <Widget>[
                    new Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              'Factory 1',
                              style: TextStyle(
                                color: Color(0xFF556DD3),
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
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  children: <Widget>[
                    new Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              'Factory 2',
                              style: TextStyle(
                                color: Color(0xFF556DD3),
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
