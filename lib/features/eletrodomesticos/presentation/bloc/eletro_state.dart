import 'package:gerenciador_energia/features/eletrodomesticos/data/models/EletrodomesticoModel.dart';

abstract class EletrodomesticosStates {
  const EletrodomesticosStates();
}

class InitialState extends EletrodomesticosStates {}

class LoadingEletrodomesticos extends EletrodomesticosStates {}

class IsEmptyList extends EletrodomesticosStates {}

class SuccessGetEletrodomesticos extends EletrodomesticosStates{
  final List<EletrodomesticoModel> eletrodomesticos;
  SuccessGetEletrodomesticos(this.eletrodomesticos);
  
}

class ErrorGetEletrodomesticos extends EletrodomesticosStates{
  final String error;

  ErrorGetEletrodomesticos(this.error);
}