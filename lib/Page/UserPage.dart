import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        stream: uno(),
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
                trailing: OutlinedButton(
                  child: Text('Borrar'),
                  onPressed: () {
                    FirestoreService().borrar(plantas.id);
                  },
                ),
              );
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

  Future<dynamic> GetNombre() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance
        .collection("Listas")
        .doc(firebaseUser.uid)
        .get()
        .then((DocumentSnapshot docs) {
      final data = docs.data() as Map<String, dynamic>;
      final role = data['nombre'];
      print("---------------------------------------");
      print(role.toString());
      print("---------------------------------------");
      return role;
    });
    return "";
  }

  Stream<QuerySnapshot> uno() {
    // print("---------------------------------------");
    // print(GetNombre());
    // print("---------------------------------------");
    return FirebaseFirestore.instance
        .collection('Plantas')
        .where('nombre', isEqualTo: GetNombre())
        .snapshots();
  }
}
