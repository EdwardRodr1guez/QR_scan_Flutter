import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scan/models/db_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapaScreen extends StatefulWidget {
   
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  
  Completer<GoogleMapController> _controller=Completer();

  @override
  Widget build(BuildContext context) {
    //final ScanModel scan = ModalRoute.of(context).settings.arguments;


    final CameraPosition puntoInicial = CameraPosition(
      target: LatLng(37.42,-122),
      zoom: 14.4746
    );
    final ScanModel scan =  ModalRoute.of(context)!.settings.arguments as ScanModel;


    return Scaffold(
      appBar: AppBar(title: Text("Mapa")),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        }),
    );
  }
}