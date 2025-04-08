
import 'package:gerenciador_energia/features/eletrodomesticos/data/data_sources/database/EletrodomesticoDatabaseHelper.dart';
import 'package:gerenciador_energia/features/eletrodomesticos/domain/repository/eletro_repository.dart';

import '../models/EletrodomesticoModel.dart';

class EletrodomesticoRepositoryImpl extends EletrodomesticoRepository {
  

  final EletroDatabaseHelper eletroDatabaseHelper;

  EletrodomesticoRepositoryImpl(
      this.eletroDatabaseHelper
  );

  @override
  Future<List<Map<String, dynamic>>> getEletrodomestico(
      int id
      ) async {
    var eletrodomesticos;
    print("eletrodomesticos $eletrodomesticos");
    try {
      eletrodomesticos = eletroDatabaseHelper.getEletrodomestico(id);
      print("all eletrodomesticos $eletrodomesticos");
    } catch ( exception ){
      print(exception.toString());
    }
    return eletrodomesticos;
  }

  @override
  Future<List<Map<String, dynamic>>> getAllEletrodomesticos() async {
    var eletrodomesticos;
    print("eletrodomesticos $eletrodomesticos");
    try {
      eletrodomesticos = eletroDatabaseHelper.getAllEletrodomesticos();
      print("all eletrodomesticos $eletrodomesticos");
    } catch ( exception ){
      print(exception.toString());
    }
    return eletrodomesticos;
  }

  @override
  Future<int> insertEletro(
      EletrodomesticoModel eletro
      ) async {
    var eletrodomesticos;
    print("eletrodomesticos $eletrodomesticos");
    try {
      eletrodomesticos = eletroDatabaseHelper.insertEletro(eletro);
      print("inserted eletrodomesticos $eletrodomesticos");
    } catch ( exception ){
      print(exception.toString());
    }
    return eletrodomesticos;
  }

  @override
  Future<int> updateEletro(
      EletrodomesticoModel eletro
      ) async {
    var eletrodomesticos;
    print("eletrodomesticos $eletrodomesticos");
    try {
      eletrodomesticos = eletroDatabaseHelper.updateEletro(eletro);
      print("updated eletrodomesticos $eletrodomesticos");
    } catch ( exception ){
      print(exception.toString());
    }
    return eletrodomesticos;
  }

  @override
  Future<int> deleteEletro(
      int id
      ) async {
    var eletrodomesticos;
    print("eletrodomesticos $eletrodomesticos");
    try {
      eletrodomesticos = eletroDatabaseHelper.deleteEletro(id);
      print("deleted eletrodomesticos $eletrodomesticos");
    } catch ( exception ){
      print(exception.toString());
    }
    return eletrodomesticos;
  }
}