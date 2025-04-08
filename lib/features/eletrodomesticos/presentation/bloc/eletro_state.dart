

abstract class EletrodomesticosStates {
  const EletrodomesticosStates();
}

class InitialState extends EletrodomesticosStates {}

class LoadingEletrodomesticos extends EletrodomesticosStates {}


class SuccessGetEletrodomesticos extends EletrodomesticosStates{
  final List<Map<String, String>> eletrodomesticos;

  SuccessGetEletrodomesticos(this.eletrodomesticos);
}

class ErrorGetEletrodomesticos extends EletrodomesticosStates{
  final String error;

  ErrorGetEletrodomesticos(this.error);
}