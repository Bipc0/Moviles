import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/servicios_turismo.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_application_1/Page/HomePage.dart';

class HomeForm extends StatelessWidget {
  const HomeForm();

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
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Servicio()));
                  },
                ),
                ListTile(
                  title: const Text('Contacto Turismo Atacama'),
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
            bottom: TabBar(tabs: [Tab(text: 'Contacto')]),
          ),
          body: ContactosPage(),
        ));
  }
}

class ContactosPage extends StatefulWidget {
  const ContactosPage();

  @override
  State<ContactosPage> createState() => _ServiciosPageState();
}

class _ServiciosPageState extends State<ContactosPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: (Column(children: [
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          icon: const Icon(MdiIcons.at),
          hintText: 'Escribe tu correo',
          labelText: 'Correo',
        ),
      ),
      TextFormField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          icon: const Icon(MdiIcons.numeric),
          hintText: 'Escribe tu edad',
          labelText: 'Edad',
        ),
      ),
      TextFormField(
        decoration: const InputDecoration(
          icon: const Icon(MdiIcons.calendar),
          hintText: 'Escribe la fecha',
          labelText: 'Fecha',
        ),
      ),
    ])));
  }
}
