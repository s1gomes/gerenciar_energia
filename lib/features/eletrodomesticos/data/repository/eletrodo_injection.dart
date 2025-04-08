

import 'package:gerenciador_energia/features/eletrodomesticos/data/data_sources/database/EletrodomesticoDatabaseHelper.dart';
import 'package:gerenciador_energia/features/eletrodomesticos/data/repository/eletrodomestico_repository_impl.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initEletrodomesticsoInjections();
}

initEletrodomesticsoInjections() {
  sl.registerSingleton(EletrodomesticoRepositoryImpl(sl()));
  sl.registerSingleton(EletroDatabaseHelper);
  
}
