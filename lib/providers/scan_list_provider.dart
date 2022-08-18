
import 'package:flutter/material.dart';
import 'package:qr_scan/models/db_provider.dart';
import 'package:qr_scan/models/scan_model.dart';

class ScanListProvider extends ChangeNotifier{

  List<ScanModel?> scans   =[];
  String tipoSeleccionado ='http';

  //método#1
  Future<ScanModel?> nuevoScan(String valor) async{
    final nuevoScan = new ScanModel(valor:valor);
    final id        = await DBProvider.db.nuevoScan(nuevoScan);
    //Asignar el id de la base de datos al modelo
    nuevoScan.id    = id;

    if (this.tipoSeleccionado == nuevoScan.tipo){
        this.scans.add(nuevoScan);
        notifyListeners();
    }

    return nuevoScan;
   }

  //método#2
  cargarScan() async{
    final scans = await DBProvider.db.getAll();
    this.scans  = [... scans];
    notifyListeners();

  }

  //método#3
  cargarScanByTipo(String tipo) async {
    final scans           = await DBProvider.db.getScanByType(tipo);
    this.scans            =  [... scans];
    this.tipoSeleccionado =  tipo;
    notifyListeners();
  }

  //método#4
  borrarTodos()async{
    await DBProvider.db.deleteAllScan();
    this.scans =[];
    notifyListeners();
  }

  //Método#5
  borrarScanById(int id) async {
    await DBProvider.db.deleteScan(id);
    this.cargarScanByTipo(this.tipoSeleccionado);
    //notifyListeners();

  }

}