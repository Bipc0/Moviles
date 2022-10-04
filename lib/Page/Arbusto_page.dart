import 'package:flutter/material.dart';
import 'package:flutter_application_1/Forma.dart';

class Arbusto2 extends StatefulWidget {
  const Arbusto2();

  @override
  State<Arbusto2> createState() => _Arbusto2State();
}

class _Arbusto2State extends State<Arbusto2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Plantas',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Forma(
              Nombre: 'Azara dentata',
              image: 'azara_dentata.jpg',
              Familia: 'Salicaceae',
            )
          ],
        ),
      ),
    );
  }
}
