import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scan/models/scan_model.dart';
export 'package:qr_scan/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

//https://www.udemy.com/course/flutter-ios-android-fernando-herrera/learn/lecture/14576080#questions/16576554

class DBProvider {

 static Database? _database;
 static final DBProvider db = DBProvider._();

 DBProvider._();


 //Básicamente es, o para inicializar la base de datos, u obtener el valor
 Future <Database> get database async {
    if (_database != null) return _database!;
    _database =await initDB();
    return _database!;
 }

 Future <Database> initDB() async {
    // path de almacenamiento de la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // 121334454-122435565 ...
    final path =join(documentsDirectory.path,'ScansDB.db'); //la extensión es importante
    print (path);

    //Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version)async{
        await db.execute(''' 
                 CREATE TABLE Scans(
                  id INTEGER PRIMARY KEY,
                  tipo TEXT,
                  valor TEXT
                 )
                        ''');
      }
    );
 }


 //Nuevos métodos:
 Future<int> nuevoScanRaw(ScanModel nuevoScan) async{
  final id    = nuevoScan.id;
  final tipo  = nuevoScan.tipo;
  final valor = nuevoScan.valor;
   
  final db  = await database;         //ejecuta el getter para verificar la base de datos
  final res = await db.rawInsert(''' 
              INSERT INTO Scans(id,tipo,valor)
              VALUES($id,'$tipo','$valor')
''');                                //Respuesta

   return res;
 }

 Future<int> nuevoScan (ScanModel nuevoScan) async{
  final db  = await database;
  final res = db.insert('Scans', nuevoScan.toJson());
  return res;
 }


  //Obtener selects (registros)
  Future<ScanModel?> getScanById(int id) async{
   final db  = await database;

   final res = await db.query('Scans', where: 'id=?', whereArgs: [id]); //? significa whereArgs
   return res.isNotEmpty  ? ScanModel.fromJson(res.first): null;
  }


   //Obtener selects de todo (registros de tipo)
  Future<List<ScanModel?>> getScanByType(String tipo) async{
   final db  = await database;

   final res = await db.rawQuery('''

    SELECT * FROM Scans WHERE tipo = "$tipo"

   ''');


   return res.isNotEmpty  
         ? res.map((s) => ScanModel.fromJson(s)).toList()
         : [];
  }


   //Obtener selects de todo (registros de todo)
  Future<List<ScanModel?>> getAll() async{
   final db  = await database;

   final res = await db.query('Scans'); //? significa whereArgs
   return res.isNotEmpty  
         ? res.map((s) => ScanModel.fromJson(s)).toList()
         : [];
  }


}