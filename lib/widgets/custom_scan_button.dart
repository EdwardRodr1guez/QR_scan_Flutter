import 'package:flutter/material.dart';

class CustomScanButton extends StatelessWidget {
  const CustomScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
     onPressed: (){},
     child: Icon(Icons.filter_center_focus),
    );
  }
}