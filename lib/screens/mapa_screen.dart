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
  MapType maptype=  MapType.normal;


  @override
  Widget build(BuildContext context) {
    
    final ScanModel scan =  ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 14.4746
    );
   
    //Marcadores: 
    Set<Marker> markers = new Set <Marker>();
    markers.add(new Marker(
      markerId: MarkerId('Geo-Location'),
      position: scan.getLatLng()));

    return Scaffold(
      appBar: AppBar(title: Text("Mapa"),
      actions: [IconButton( 
        icon: Icon(Icons.location_disabled),
        onPressed: () async {

          final GoogleMapController controller = await _controller.future;
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target:scan.getLatLng(),
                zoom: 27,
                tilt: 50 )

          ));

        },)],),
      body: GoogleMap(
        mapType: maptype,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        }),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed:(){
         if(maptype==MapType.normal){
            maptype=MapType.satellite;
         }else{
            maptype=MapType.normal;
         }

         setState(() {});
        } ),  
    );
  }
}