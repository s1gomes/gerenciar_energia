
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class EstatisticaPage extends StatefulWidget {
  const EstatisticaPage({super.key});

  @override
  State<EstatisticaPage> createState() => _EstatisticaPageState();
}

class _EstatisticaPageState extends State<EstatisticaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Estatística"),
      ),
      // drawer: const AppDrawerWidget(),

    );

  }
  }