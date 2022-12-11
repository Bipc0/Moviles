import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/services/firestore_service.dart';

class FirestoreService {
  //obtener los productos
  Stream<QuerySnapshot> plantas() {
    // return FirebaseFirestore.instance.collection('productos').snapshots();
    return FirebaseFirestore.instance.collection('Plantas').snapshots();
  }

  //agregar
  Future agregar(String familia, String nombre, String region) {
    return FirebaseFirestore.instance.collection('Plantas').doc().set({
      'familia': familia,
      'nombre': nombre,
      'region': region,
    });
  }

  Future getCurrentUser() async {
    var user = await FirebaseAuth.instance.currentUser!;
    final uid = user.uid;
    print(uid);
    return uid.toString();
  }

  //void addData() async {
  //  String userid = await getCurrentUser();
  //  FirebaseFirestore.instance.collection('Plantas').add({
  //   'category': category,
  //   'location': locatio,
  //  'subject': adName,
  // 'userId': userid,
  //});
  //}

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
