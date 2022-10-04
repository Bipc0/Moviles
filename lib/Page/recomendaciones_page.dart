import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Recomendaciones extends StatefulWidget {
  const Recomendaciones();

  @override
  State<Recomendaciones> createState() => _RecomendacionesState();
}

class _RecomendacionesState extends State<Recomendaciones> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text('C1 DAM020-2022-2'),
            centerTitle: true,
            bottom: PreferredSize(
                child: Text("Diego Jorquera"), preferredSize: Size.zero),
            leading: const Icon(MdiIcons.accountCash)),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
