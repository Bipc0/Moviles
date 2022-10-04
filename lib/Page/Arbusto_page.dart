import 'package:flutter/material.dart';
import 'package:flutter_application_1/Forma.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
          title: const Text('C1 DAM020-2022-2'),
          centerTitle: true,
          bottom: PreferredSize(
              child: Text("Diego Jorquera"), preferredSize: Size.zero),
          leading: const Icon(MdiIcons.accountCash)),
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
