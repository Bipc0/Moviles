import 'package:flutter/material.dart';

class Visita extends StatefulWidget {
  Visita({Key? key}) : super(key: key);

  @override
  State<Visita> createState() => _VisitaState();
}

class _VisitaState extends State<Visita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffd9a76c),
        centerTitle: true,
        title: Text('Visitas'),
      ),
    );
  }
}
