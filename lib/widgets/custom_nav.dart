import 'package:flutter/material.dart';
class CustomNav extends StatelessWidget {
  const CustomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
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

