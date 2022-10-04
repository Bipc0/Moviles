import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/Arbol_page.dart';
import 'package:flutter_application_1/Page/Arbusto_page.dart';
import 'package:flutter_application_1/Page/Flores_page.dart';
import 'package:flutter_application_1/Page/Flores_page.dart';
import 'package:flutter_application_1/Page/servicios_turismo.dart';
import 'package:flutter_application_1/Page/contactos_page.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                  color: Colors.lightGreen,
                ),
                child: Text('Seleccione Servicio'),
              ),
              ListTile(
                title: const Text('Flora Regional'),
                onTap: () {
                  Flores();
                },
              ),
              ListTile(
                title: const Text('Turismo Atacama'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Servicio()));
                },
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
          backgroundColor: Colors.lightGreen,
          title: Text(
            'Flora Regional de Valparaiso',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(tabs: [
            Tab(text: 'Flores'),
            Tab(text: 'Arbusto'),
            Tab(text: 'Arboles')
          ]),
        ),
        body: TabBarView(children: [
          Flores(),
          Arbusto2(),
          Arbol(),
        ]),
      ),
    );
  }
}
