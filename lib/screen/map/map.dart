import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:water_iot/SharedPref.dart';

import '../../constants.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MapPageState();
}

class _MapPageState extends State {
  List<Marker> _markers = [];
  List<LatLng> _list = [];
  Completer<GoogleMapController> _controller = Completer();
  static final LatLng _kMapCenter =
      LatLng(19.018255973653343, 72.84793849278007);
  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
  CameraPosition vegasPosition = CameraPosition(
      target: LatLng(double.parse(listFactoryLocal[0].langtitude),
          double.parse(listFactoryLocal[0].longtitude)),
      zoom: 5);

  @override
  // ignore: must_call_super
  void initState() {
    addMarker();
    loadBound();
  }

  addMarker() {
    for (var i = 0; i < listFactoryLocal.length; i++) {
      _markers.add(Marker(
          markerId: MarkerId(listFactoryLocal[i].id.toString()),
          position: LatLng(double.parse(listFactoryLocal[i].langtitude),
              double.parse(listFactoryLocal[i].longtitude)),
          infoWindow: InfoWindow(title: listFactoryLocal[i].name)));
      _list.add(LatLng(double.parse(listFactoryLocal[i].langtitude),
          double.parse(listFactoryLocal[i].longtitude)));
    }
  }

  loadBound() async {
    final GoogleMapController controller = await _controller.future;
    Future.delayed(
        Duration(milliseconds: 200),
        () => controller.animateCamera(
            CameraUpdate.newLatLngBounds(boundsFromLatLngList(_list), 1)));
  }

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
              SingleChildScrollView(
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      _buildCard(),
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
                        Expanded(
                          child: Container(
                            height: 350,
                            width: MediaQuery.of(context).size.width,
                            child: GoogleMap(
                              initialCameraPosition: vegasPosition,
                              mapType: MapType.normal,
                              markers: Set<Marker>.of(_markers),
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
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
              for (var i = 0; i < listFactoryLocal.length; i++)
                InkWell(
                  onTap: () async {
                    final GoogleMapController controller =
                        await _controller.future;
                    controller.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: LatLng(
                              double.parse(listFactoryLocal[i].langtitude),
                              double.parse(listFactoryLocal[i].longtitude)),
                          zoom: 15.0),
                    ));
                    // _mapController.moveCamera(CameraUpdate.newLatLng(LatLng(double.parse(listFactoryLocal[i].langtitude),double.parse(listFactoryLocal[i].longtitude))));
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    child: Column(
                      children: <Widget>[
                        Divider(
                          color: Colors.black,
                          thickness: 0.1,
                        ),
                        new Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: SvgPicture.asset(
                                    'assets/images/ic_place.svg',
                                    color: Color(0xFF556DD3),
                                    height: 20.0,
                                    width: 20.0,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                child: Text(
                                  listFactoryLocal[i].name,
                                  style: TextStyle(
                                    color: Color(0xFF556DD3),
                                    fontFamily: 'OpenSans',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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
                                  listFactoryLocal[i].address,
                                  style: TextStyle(
                                    color: textDashboardColor,
                                    fontFamily: 'OpenSans',
                                    fontSize: 15.0,
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
                )
            ],
          ),
        ),
      ),
    );
  }

  LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    double x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1) y1 = latLng.longitude;
        if (latLng.longitude < y0) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(northeast: LatLng(x1, y1), southwest: LatLng(x0, y0));
  }
}
