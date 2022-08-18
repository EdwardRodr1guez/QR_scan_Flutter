

import 'package:flutter/material.dart';
import 'package:qr_scan/models/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async{
  final url = scan.valor;
  if (scan.tipo == "http"){

     if (await canLaunchUrl(Uri.parse(url))){
      await launchUrl(Uri.parse(url));
    } else {
      throw "could not launch $url";
    }

 
  } else {

    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}