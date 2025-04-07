
import 'package:flutter/cupertino.dart';
import 'package:gerenciador_energia/my_app.dart';

import 'features/eletrodomesticos/data/repository/eletrodo_injection.dart';

Future<void> main() async {
  await initInjections();
  runApp(const MyApp());
}
