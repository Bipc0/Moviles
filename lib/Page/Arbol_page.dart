import 'package:flutter/material.dart';
import 'package:flutter_application_1/Forma.dart';

class Arbol extends StatefulWidget {
  const Arbol();

  @override
  State<Arbol> createState() => _ArbolState();
}

class _ArbolState extends State<Arbol> {
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
              Nombre: 'Nothofagus obliqua',
              image: 'nothofagus_obliqua.jpg',
              Familia: 'Nothofagaceae',
            )
          ],
        ),
      ),
    );
  }
}
