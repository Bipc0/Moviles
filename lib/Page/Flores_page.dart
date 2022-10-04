import 'package:flutter/material.dart';
import 'package:flutter_application_1/Forma.dart';
class Flores extends StatefulWidget {
  const Flores();

  @override
  State<Flores> createState() => _FloresState();
}

class _FloresState extends State<Flores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Plantas', textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: ListView(
        children: [
        Forma(
          Nombre: 'Fumaria blanca',
          image: '',
          Familia: 'Papaveraceae',
        )
        ],
        ),
        ),
      );
  }
}