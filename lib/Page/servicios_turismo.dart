import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/servicios_page.dart';
import 'package:flutter_application_1/Page/HomePage.dart';

class Servicio extends StatefulWidget {
  const Servicio();

  @override
  State<Servicio> createState() => _ServicioState();
}

class _ServicioState extends State<Servicio> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
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
                  color: Colors.blue,
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
            Tab(text: 'Servicios'),
          ]),
        ),
        body: TabBarView(children: [
          ServiciosPage(),
        ]),
      ),
    );
  }
}
