import 'package:flutter/material.dart';
import 'package:flutter_application_1/Forma.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
          title: const Text('C1 DAM020-2022-2'),
          centerTitle: true,
          bottom: PreferredSize(
              child: Text("Diego Jorquera",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              preferredSize: Size.zero),
          leading: const Icon(MdiIcons.accountCash)),
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
