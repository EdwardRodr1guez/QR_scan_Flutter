import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/providers/scan_list_provider.dart';
import 'package:qr_scan/utils/utils.dart';

class CustomScanButton extends StatelessWidget {
  const CustomScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return FloatingActionButton(
     child: Icon(Icons.filter_center_focus),
     onPressed: () async {
      //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar',false, ScanMode.QR);
      final barcodeScanRes="geo:45.289989,-75.922405";

      if (barcodeScanRes == '-1'){
        return;
      }
      final scanListProvider=Provider.of<ScanListProvider>(context,listen: false);
      //scanListProvider.nuevoScan(barcodeScanRes);
      //scanListProvider.nuevoScan("geo:15.33,15.66");

      final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
      launchURL(context, nuevoScan!);

     },
     
    );
  }
}


