import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciador_energia/features/eletrodomesticos/data/models/EletrodomesticoModel.dart';
import 'package:gerenciador_energia/features/eletrodomesticos/domain/repository/eletro_repository.dart';
import 'package:gerenciador_energia/features/eletrodomesticos/presentation/bloc/eletro_event.dart';
import 'package:gerenciador_energia/features/eletrodomesticos/presentation/bloc/eletro_state.dart';

class EletrodomesticoBloc extends Bloc<EletrodomesticoEvent, EletrodomesticosStates> {
  final EletrodomesticoRepository eletrodomesticoRepository;

  EletrodomesticoBloc({
    required this.eletrodomesticoRepository
  }) : super(LoadingEletrodomesticos()) {
    on<GetEletrodomesticos>(_GetEletrodomestico);
  }

  _GetEletrodomestico(
    GetEletrodomesticos event, Emitter<EletrodomesticosStates> emitter
  ) async {
    emitter(LoadingEletrodomesticos());

    try {
      final eletrodomesticos = await eletrodomesticoRepository.getAllEletrodomesticos();
       if (eletrodomesticos.isNotEmpty) {
          emitter(SuccessGetEletrodomesticos(eletrodomesticos));
        } else {
          emitter(IsEmptyList());
        }
    
    } catch (exception) {
      emitter(ErrorGetEletrodomesticos(exception.toString()));
    }


    

  
  }
}