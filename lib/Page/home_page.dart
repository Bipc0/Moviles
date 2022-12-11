import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/ListPage.dart';
import 'package:flutter_application_1/Page/UserPage.dart';

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
        ),
        body: TabBarView(children: [
          ListPage(),
          UserPage(),
        ]),
      ),
    );
  }
}
