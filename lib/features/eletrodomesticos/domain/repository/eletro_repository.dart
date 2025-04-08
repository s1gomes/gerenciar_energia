import 'package:gerenciador_energia/features/eletrodomesticos/data/models/EletrodomesticoModel.dart';

abstract class EletrodomesticoRepository {

  Future<List<EletrodomesticoModel>> getAllEletrodomesticos();

  Future<List<EletrodomesticoModel>> getEletrodomestico(
      int id
  );

  Future<int> insertEletro(
      EletrodomesticoModel eletro
  );

  Future<int> updateEletro(
      EletrodomesticoModel eletro
  );

  Future<int> deleteEletro(
      int id
  );

}