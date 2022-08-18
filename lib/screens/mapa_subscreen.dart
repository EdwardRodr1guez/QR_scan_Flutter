import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/utils/utils.dart';

import '../providers/scan_list_provider.dart';

class MapaSubscreen extends StatelessWidget {
   
  const MapaSubscreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final scanListProvider=Provider.of<ScanListProvider>(context);
    final scans=scanListProvider.scans; 

    return ListView.builder(
      itemCount:scans.length,
      itemBuilder: (_,i)=>Dismissible(
        key: UniqueKey(),
        onDismissed: (DismissDirection direction){
                      Provider.of<ScanListProvider>(context,listen: false).borrarScanById(scans[i]!.id!);
        },
        child: ListTile(
          leading: Icon(Icons.map, color:Theme.of(context).colorScheme.primary),
          title: Text(scans[i]!.valor),
          subtitle: Text(scans[i]!.id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
          onTap: ()=>launchURL(context, scans[i]!),
        ),
      ));
    
  }
}