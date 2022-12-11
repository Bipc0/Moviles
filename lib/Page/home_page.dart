import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/ListPage.dart';
import 'package:flutter_application_1/Page/UserPage.dart';
import 'package:flutter_application_1/Page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightGreen,
            leading: Icon(
              Icons.grass,
              color: Colors.white,
            ),
            title: Text(
              'Flora Regional de Valparaiso',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            bottom: TabBar(tabs: [Tab(text: 'Plantas'), Tab(text: 'Mi Lista')]),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'logout',
                    child: Text('Cerrar Sesión'),
                  ),
                ],
                onSelected: (opcionSeleccionada) {
                  if (opcionSeleccionada == 'logout') {
                    logout(context);
                  }
                },
              ),
            ]),
        body: TabBarView(children: [
          ListPage(),
          UserPage(),
        ]),
      ),
    );
  }

  void logout(BuildContext context) async {
    //cerrar sesion en firebase
    await FirebaseAuth.instance.signOut();

    //borrar user email de shared preferences
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('userEmail');

    //redirigir al login
    MaterialPageRoute route =
        MaterialPageRoute(builder: ((context) => LoginPage()));
    Navigator.pushReplacement(context, route);
  }
}
