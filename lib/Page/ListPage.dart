import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Page/login_page.dart';
import 'package:flutter_application_1/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          MdiIcons.viewList,
          color: Colors.yellow,
        ),
        backgroundColor: Color.fromARGB(255, 0, 113, 26),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lista de Plantas'),
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
                          FirestoreService().agregarUser(
                              plantas['familia'],
                              plantas['nombre'],
                              plantas['region'],
                              plantas['image'],
                              getCurrentUID());
                        },
                        icon: const Icon(Icons.add)),
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Row(
                                children: [
                                  Container(
                                      child: Column(
                                    children: [
                                      Text(plantas['nombre']),
                                      Image.network(
                                        plantas['image'],
                                        width: 250,
                                        height: 250,
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                              content: Text('Familia: ${plantas['familia']}'),
                              actions: [
                                TextButton(
                                  child: Text('Ok'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.list))
                  ]));
            },
          );
        },
      ),
    );
  }

  Future<String> getUserEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('userEmail') ?? '';
  }

  String getCurrentUID() {
    var firebaseUser = FirebaseAuth.instance.currentUser!;
    String uid = firebaseUser.uid.toString();

    return uid;
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
