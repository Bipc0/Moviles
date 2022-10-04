import 'package:flutter/material.dart';

class Viaje extends StatefulWidget {
  Viaje({Key? key}) : super(key: key);

  @override
  State<Viaje> createState() => _ViajeState();
}

class _ViajeState extends State<Viaje> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffd9a76c),
        centerTitle: true,
        title: Text('Viaje'),
      ),
      body: Container(
        height: 320.0,
        width: 500.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Alpaca.jpg'),
          ),
        ),
      ),
    );
  }
}
