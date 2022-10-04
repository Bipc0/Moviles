import 'package:flutter/material.dart';

class Fecha extends StatefulWidget {
  Fecha({Key? key}) : super(key: key);

  @override
  State<Fecha> createState() => _FechaState();
}

class _FechaState extends State<Fecha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffd9a76c),
        title: Text('Fecha'),
        centerTitle: true,
      ),
    );
  }
}
