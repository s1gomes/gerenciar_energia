
import 'package:gerenciador_energia/features/eletrodomesticos/data/data_sources/database/EletrodomesticoDatabaseHelper.dart';
import 'package:gerenciador_energia/features/eletrodomesticos/data/repository/eletrodomestico_repository_impl.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> initInjections() async {
  await initEletrodomesticsoInjections();
}

initEletrodomesticsoInjections() {
  getIt.registerSingleton<EletroDatabaseHelper>(EletroDatabaseHelper());
  getIt.registerSingleton<EletrodomesticoRepositoryImpl>(EletrodomesticoRepositoryImpl());
}
