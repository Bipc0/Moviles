import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_application_1/Page/planta_agregar_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Page/login_page.dart';
import 'package:flutter_application_1/Page/planta_editar_page.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        ],
        leading: Icon(
          MdiIcons.leaf,
          color: Colors.yellow,
        ),
        backgroundColor: Color.fromARGB(255, 0, 113, 26),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mis Plantas'),
            FutureBuilder(
              future: this.getUserEmail(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Cargando...');
                }
                return Text(
                  snapshot.data,
                  style: TextStyle(fontSize: 12),
                );
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: FirestoreService().plantas(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var plantas = snapshot.data!.docs[index];
              //print('PRODUCTO:' + producto.data().toString());
              return ListTile(
                leading: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(plantas['image']),
                ),
                title: Text(plantas['nombre']),
                subtitle: Text('Familia: ${plantas['familia']}'),
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                  IconButton(
                      onPressed: () {
                        FirestoreService().borrar(plantas.id);
                      },
                      icon: const Icon(Icons.delete)),
                  IconButton(
                      onPressed: () {
                        var nombre = plantas['nombre'];
                        MaterialPageRoute route = MaterialPageRoute(
                            builder: ((context) => new EditarPlanta(nombre)));
                        Navigator.push(context, route);
                      },
                      icon: const Icon(Icons.edit))
                ]),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          MaterialPageRoute route =
              MaterialPageRoute(builder: ((context) => ProductosAgregarPage()));
          Navigator.push(context, route);
        },
      ),
    );
  }

  Future<String> getUserEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('userEmail') ?? '';
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
