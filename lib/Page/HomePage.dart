import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/Arbol_page.dart';
import 'package:flutter_application_1/Page/Arbusto_page.dart';
import 'package:flutter_application_1/Page/Flores_page.dart';
import 'package:flutter_application_1/Page/Turismo.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
          bottom: TabBar(tabs: [
            Tab(text: 'Flores'),
            Tab(text: 'Arbusto'),
            Tab(text: 'Arboles'),
            Tab(text: 'Turismo')
          ]),
        ),
        body: TabBarView(
            children: [Flores(), Arbusto2(), Arbol(), TurismoPage()]),
      ),
    );
  }
}
