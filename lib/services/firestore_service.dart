import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  //obtener los productos
  Stream<QuerySnapshot> plantas() {
    // return FirebaseFirestore.instance.collection('productos').snapshots();
    return FirebaseFirestore.instance.collection('Plantas').snapshots();
  }

  Stream<QuerySnapshot> uno() {
    return FirebaseFirestore.instance
        .collection('Plantas')
        .where('nombre', isEqualTo: myFunction())
        .snapshots();
  }

  String myFunction() {
    String result = "";
    getMyFieldValue(getCurrentUID()).then((String data) {
      result = data;
      return data;
    });

    return result;
  }

  String getCurrentUID() {
    var firebaseUser = FirebaseAuth.instance.currentUser!;
    String uid = firebaseUser.uid.toString();

    return uid;
  }

  Future<String> getMyFieldValue(String uid) async {
    CollectionReference collRef =
        FirebaseFirestore.instance.collection('Listas');

    QuerySnapshot snapshot = await collRef.where('uid', isEqualTo: uid).get();

    DocumentSnapshot doc = snapshot.docs.first;

    return doc.get('nombre');
  }

  //agregar
  Future agregar(String familia, String nombre, String region, String image) {
    return FirebaseFirestore.instance.collection('Plantas').doc().set({
      'familia': familia,
      'nombre': nombre,
      'region': region,
      'image': image,
    });
  }

  Future agregarMilista(String familia, String nombre, String region) {
    return FirebaseFirestore.instance.collection('Plantas').doc().set({
      'familia': familia,
      'nombre': nombre,
      'region': region,
    });
  }

  //borrar
  Future borrar(String nombre) {
    return FirebaseFirestore.instance
        .collection('Plantas')
        .doc(nombre)
        .delete();
  }
}
