
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciador_energia/features/comodos/presentation/bloc/bloc_comodos/comodo_event.dart';
import 'package:gerenciador_energia/features/eletrodomesticos/data/models/EletrodomesticoModel.dart';
import 'package:gerenciador_energia/features/eletrodomesticos/data/repository/eletrodo_injection.dart';
import 'package:gerenciador_energia/features/eletrodomesticos/domain/repository/eletro_repository.dart';
import 'package:gerenciador_energia/features/eletrodomesticos/presentation/bloc/eletro_event.dart';
import 'package:gerenciador_energia/features/eletrodomesticos/presentation/bloc/eletro_state.dart';
import 'package:gerenciador_energia/features/eletrodomesticos/presentation/bloc/eletro_bloc.dart';
import '../../../data/data_sources/database/EletrodomesticoDatabaseHelper.dart';


class EletrodomesticosPage extends StatefulWidget {
  const EletrodomesticosPage({super.key});

  @override
  State<EletrodomesticosPage> createState() => _EletrodomesticosPageState();
}

class _EletrodomesticosPageState extends State<EletrodomesticosPage> {

  final EletrodomesticoBloc _eletrodomesticoBloc = EletrodomesticoBloc(eletrodomesticoRepository: sl<EletrodomesticoRepository>());
  List<EletrodomesticoModel> eletrodomesticos = [];


  @override
  void initState() {
    
    callEletrodomesticos();
    super.initState();
  }
  // Future getEletrodomesticos() async {
  //   List<EletrodomesticoModel> eletrodomesticos = await getAllEletrodomesticos();
  //   return eletrodomesticos;
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.green,
        title: const Text("Eletrodomésticos"),
      ),
      // drawer: const AppDrawerWidget(),
      body: BlocConsumer(
        bloc: _eletrodomesticoBloc,
        listener: (context, state) {
          if (state is SuccessGetEletrodomesticos) {
            eletrodomesticos.clear();
            eletrodomesticos = state.eletrodomesticos;
          }
        },
        builder: (context, state) {
          if (state is LoadingEletrodomesticos) {
            return const CircularProgressIndicator();
          } else if (state is ErrorGetEletrodomesticos) {
             
             return Center(
                child: Row(
                  children: [
                    Text('Error: ${state.error}'),
          
                    IconButton(
                        onPressed: () {
                          callEletrodomesticos();
                      //recall fetch function
                    }, icon: const Icon(
                        Icons.replay_sharp,
                      color: Colors.black,
                    ))
                  ],
                ),
              );
              // return ReloadWidget.error(
              //   content: state.error,
              //   onPressed: () {
              //     callEletrodomesticos();
              //   }
              // );
          }
          if (eletrodomesticos.isEmpty) {
              return Center(
                child: Row(
                  children: [
                    Text('Cadastre um eletrodoméstico.'),
          
                    IconButton(
                        onPressed: () {
                          callEletrodomesticos();
                      //recall fetch function
                    }, icon: const Icon(
                        Icons.replay_sharp,
                      color: Colors.black,
                    ))
                  ],
                ),
              );

            // return ReloadWidget.empty(
              // content: S.of(context).no_data
            // );
          }

          return ListView.builder(
            itemCount: eletrodomesticos.length,
            itemBuilder: (context, index) {
              // Row(
              //   children: [
              //     const Text('Adicionar eletrodoméstico'),
              //     IconButton(
              //         onPressed: () {
              //           //navegar para pagina adicionar eletrodomestico
              //         }, icon: const Icon(
              //       Icons.add,
              //       color: Colors.black,
              //     ))
              //   ],
              // );
              
              return ListTile(
                  title: Text(
                     eletrodomesticos[index].name
                  ),
                  subtitle: Text('Consumo atual: ${eletrodomesticos[index].consumoEstimado}'),
                );
              }
          );
        }
      ),
    );
  }
  void callEletrodomesticos() {
  _eletrodomesticoBloc.add(
    GetEletrodomesticos()
    );
}
}

