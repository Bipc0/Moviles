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
    return Scaffold(
      body: Column(
        children: [
          Card(
            child: Container(
              height: 144,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/valle_de_la_luna.jpg'))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Valle de la luna',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
          ),
          Text('4.7 Excelente',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Card(
            child: Container(
              height: 144,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/laguna_verde.jpg'))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Laguna Verde',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
          ),
          Text('4.9 Excelente',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Card(
            child: Container(
              height: 144,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/salar_de_tara.jpg'))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Salar de Tara',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
          ),
          Text('5.0 Excelente',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ],
      ),
    );
  }
}
