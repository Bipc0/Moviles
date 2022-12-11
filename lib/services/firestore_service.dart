import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  //obtener los productos
  Stream<QuerySnapshot> plantas() {
    // return FirebaseFirestore.instance.collection('productos').snapshots();
    return FirebaseFirestore.instance.collection('Plantas').snapshots();
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
