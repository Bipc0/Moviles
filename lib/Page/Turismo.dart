import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/PageTour/ContactoPage.dart';
import 'package:flutter_application_1/Page/PageTour/Form.dart';
import 'package:flutter_application_1/Page/PageTour/FechaPage.dart';
import 'package:flutter_application_1/Page/PageTour/HorariosPage.dart';
import 'package:flutter_application_1/Page/PageTour/ViajesPage.dart';
import 'package:flutter_application_1/Page/PageTour/VisitaPage.dart';

class TurismoPage extends StatefulWidget {
  TurismoPage({Key? key}) : super(key: key);

  @override
  State<TurismoPage> createState() => _TurismoPageState();
}

class _TurismoPageState extends State<TurismoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffd9a76c),
        leading: Icon(Icons.tour),
        title: Text(
          'C1 DAM020-2022-2',
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          child: Text(
            'Jetro Vasquez',
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(0),
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 700.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                child: const Text('Visitas'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Visita()));
                },
              ),
              RaisedButton(
                  child: const Text('Fechas'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Fecha()));
                  }),
              RaisedButton(
                  child: const Text('Horarios'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Horario()));
                  }),
              RaisedButton(
                  child: const Text('Viajes'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Viaje()));
                  }),
              RaisedButton(
                  child: const Text('Contacto'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ConPage()));
                  }),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xffa48963),
    );
  }
}
