import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/contactos_page.dart';
import 'package:flutter_application_1/Page/HomePage.dart';
import 'package:flutter_application_1/Page/visitas_page.dart';
import 'package:flutter_application_1/Page/fechas_page.dart';
import 'package:flutter_application_1/Page/horarios_page.dart';
import 'package:flutter_application_1/Page/recomendaciones_page.dart';

class Servicio extends StatefulWidget {
  const Servicio();

  @override
  State<Servicio> createState() => _ServicioState();
}

class _ServicioState extends State<Servicio> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 224, 180, 98),
                ),
                child: Text('Seleccione Servicio'),
              ),
              ListTile(
                title: const Text('Flora Regional'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                },
              ),
              ListTile(
                title: const Text('Turismo Atacama'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Contacto Turismo Atacama'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomeForm()));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 224, 180, 98),
          title: Text(
            'Servicio Turismo Atacama',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(tabs: [
            Tab(text: 'Visitas'),
            Tab(text: 'Fechas'),
            Tab(text: 'Horarios'),
            Tab(text: 'Recomendaciones'),
          ]),
        ),
        body: TabBarView(
            children: [Visitas(), Fechas(), Horarios(), Recomendaciones()]),
      ),
    );
  }
}
