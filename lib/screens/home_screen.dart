

import 'package:flutter/material.dart';
import 'package:qr_scan/widgets/custom_nav.dart';
import 'package:qr_scan/widgets/custom_scan_button.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Historial"),
                    backgroundColor: Colors.red,
                    elevation: 0,
                    actions: [
                      IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.delete_forever))
                    ],
      ),

      body: Center(
         child: Text('HomeScreen'),
      ),

      bottomNavigationBar: CustomNav(),
      floatingActionButton:CustomScanButton() ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}