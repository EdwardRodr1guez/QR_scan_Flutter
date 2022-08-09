

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/providers/ui_provider.dart';
import 'package:qr_scan/screens/screens.dart';
import 'package:qr_scan/widgets/custom_nav.dart';
import 'package:qr_scan/widgets/custom_scan_button.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Historial"),
                    //backgroundColor: Colors.red,
                    elevation: 0,
                    actions: [
                      IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.delete_forever))
                    ],
      ),

      body               : _HomeScreenBody(),

      bottomNavigationBar: CustomNav(),
      floatingActionButton:CustomScanButton() ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //OBTENER EL SELECTED MENU OPT
    final uiProvider = Provider.of<UiProvider>(context);  //específicamos el tipo (la clase) de provaider que vamos a traer

    final currentIdx =uiProvider.selectedMenuOpt;
    switch (currentIdx){

      case 0:
      return MapaSubscreen();

      case 1:
      return DireccionSubscreen();

      default: 
      return MapaSubscreen();
    }
  }
}