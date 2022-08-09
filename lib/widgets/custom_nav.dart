import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/providers/ui_provider.dart';
class CustomNav extends StatelessWidget {
  const CustomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);  //específicamos el tipo (la clase) de provaider que vamos a traer
   
    final currentIdx =uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt =i,
      currentIndex: currentIdx,
      items: <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map"
           ),
           
           BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration),
            label: "Addresses"
           ),
           
      ]
  
    );
  }
}

