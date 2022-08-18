import 'package:flutter/material.dart';
import 'package:qr_scan/providers/scan_list_provider.dart';
import 'package:qr_scan/providers/ui_provider.dart';
import 'package:qr_scan/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>new UiProvider()),
        ChangeNotifierProvider(create: (_)=>new ScanListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          "home": (context) => HomeScreen(),
          "mapa": (context) => MapaScreen(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.light().copyWith(primary:  Colors.red,),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.red
            )
        ),
      ),
    );
    

  }
}