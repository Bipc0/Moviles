import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //obtener los productos
  Stream<QuerySnapshot> plantas() {
    // return FirebaseFirestore.instance.collection('productos').snapshots();
    return FirebaseFirestore.instance.collection('Plantas').snapshots();
  }

  Stream<QuerySnapshot> plantasUser(String uid) {
    // return FirebaseFirestore.instance.collection('productos').snapshots();
    return FirebaseFirestore.instance
        .collection('Listas')
        .where('uid', isEqualTo: uid)
        .snapshots();
  }

  //agregar
  Future agregar(String familia, String nombre, String image) {
    return FirebaseFirestore.instance.collection('Plantas').doc().set({
      'familia': familia,
      'nombre': nombre,
      'image': image,
    });
  }

  Future agregarUser(String familia, String nombre, String image, String uid) {
    return FirebaseFirestore.instance.collection('Listas').doc().set(
        {'familia': familia, 'nombre': nombre, 'image': image, 'uid': uid});
  }

  Future agregarMilista(String uid, String nombre) {
    return FirebaseFirestore.instance
        .collection('Plantas')
        .doc()
        .set({'nombre': nombre, 'uid': uid});
  }

  //borrar
  Future borrar(String nombre) {
    return FirebaseFirestore.instance
        .collection('Plantas')
        .doc(nombre)
        .delete();
  }

  //borrar
  Future borrarUser(String nombre) {
    return FirebaseFirestore.instance.collection('Listas').doc(nombre).delete();
  }
}
