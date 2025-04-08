import 'package:equatable/equatable.dart';

abstract class EletrodomesticoEvent extends Equatable {
  const EletrodomesticoEvent();
}

class GetEletrodomesticos extends EletrodomesticoEvent {
  final bool withLoading;
 const GetEletrodomesticos({this.withLoading = true});
 
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


