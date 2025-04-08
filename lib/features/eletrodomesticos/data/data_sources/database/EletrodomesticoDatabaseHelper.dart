import 'dart:async';
import 'dart:io';
import 'package:gerenciador_energia/features/eletrodomesticos/data/models/EletrodomesticoModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


// todo: colocar construtor 
class EletroDatabaseHelper {
  EletroDatabaseHelper._();
  static final EletroDatabaseHelper eletroDatabaseHelper = EletroDatabaseHelper._();
  static Database? _database;
  String eletrodomesticoTable = 'eletrodomesticoTable';
  String id = 'id';
  String name = 'name';
  String wattshora = 'wattshora';
  String consumoDeclarado = 'consumoDeclarado';
  String consumoEstimado = 'consumoEstimado';


  get database async {
    if (_database != null) return _database;
    return await _initializeDatabase();
  }


  _initializeDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}eletrodomesticos_database.db';
    return await openDatabase(
        path, version: 1, onCreate: _createTable);
  }

  void _createTable(Database db, int newVersion) async {
    if (_database == null) {
      await db.execute(
          'CREATE TABLE $eletrodomesticoTable('
              '$id INTEGER PRIMARY KEY, $name TEXT, voltagem TEXT, $wattshora TEXT, $consumoDeclarado TEXT, $consumoEstimado TEXT)'
      );
    }
  }

  // Crud

  Future<List<EletrodomesticoModel>> getEletrodomestico(int id) async {
    Database db = await this.database;
    final List<Map<String, Object?>> eletrodomesticoMaps = await db.rawQuery(
        'SELECT * FROM $eletrodomesticoTable WHERE $id = \'$id\' '
    );
    return [for (final  {
        'id': id as int,
      'name': name as String,
      'voltagem': voltagem as String,
      'wattshora' : wattshora  as String,
      'consumoDeclarado' : consumoDeclarado as String,
      'consumoEstimado' : consumoEstimado as String
    } in eletrodomesticoMaps
      ) EletrodomesticoModel(
        id: id, 
        name: name, 
        voltagem: voltagem, 
        wattshora: wattshora, 
        consumoDeclarado: consumoDeclarado, 
        consumoEstimado: consumoEstimado
      ) 
    ];
  }

  Future<List<EletrodomesticoModel>> getAllEletrodomesticos() async {
    Database db = await this.database;
    final List<Map<String, Object?>> eletrodomesticoMaps = await db.rawQuery(
        'SELECT * FROM $eletrodomesticoTable WHERE $id = \'$id\' '
    );
    return [for (final  {
        'id': id as int,
      'name': name as String,
      'voltagem': voltagem as String,
      'wattshora' : wattshora  as String,
      'consumoDeclarado' : consumoDeclarado as String,
      'consumoEstimado' : consumoEstimado as String
    } in eletrodomesticoMaps
      ) EletrodomesticoModel(
        id: id, 
        name: name, 
        voltagem: voltagem, 
        wattshora: wattshora, 
        consumoDeclarado: consumoDeclarado, 
        consumoEstimado: consumoEstimado
      ) 
    ];
  }

  Future<int> insertEletro(EletrodomesticoModel eletro) async {
    Database db = await this.database;
    var eletrodomesticos = await db.insert(
        eletrodomesticoTable, eletro.toMap());
    print("eletro $eletro inserted in $eletrodomesticoTable");
    return eletrodomesticos;
  }

  Future<int> updateEletro(EletrodomesticoModel eletro) async {
    Database db = await this.database;
    var eletrodomesticos = await db.update(
        eletrodomesticoTable, eletro.toMap(),
        where: '$id = ?',
        whereArgs: [eletro.id]
    );
    return eletrodomesticos;
  }

  Future<int> deleteEletro(int id) async {
    Database db = await this.database;
    var eletrodomesticos = await db.rawDelete(
        'DELETE * FROM $eletrodomesticoTable WHERE $id = ?', [id]
    );
    return eletrodomesticos;
  }
}
