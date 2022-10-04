import 'package:flutter/material.dart';

class Horario extends StatefulWidget {
  Horario({Key? key}) : super(key: key);

  @override
  State<Horario> createState() => _HorarioState();
}

class _HorarioState extends State<Horario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffd9a76c),
        centerTitle: true,
        title: Text('Horario'),
      ),
    );
  }
}
