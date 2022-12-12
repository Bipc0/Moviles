import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firestore_service.dart';

class EditarPlanta extends StatefulWidget {
  String nombre;
  EditarPlanta(this.nombre);
  @override
  State<EditarPlanta> createState() => _EditarPlantaState();
}

class _EditarPlantaState extends State<EditarPlanta> {
  final formKey = GlobalKey<FormState>();

  TextEditingController familiaCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController imagenCtrl = TextEditingController();
  String noimage =
      'https://treehouse.co/uploads/szeflera-wyjatkowa-roslina-doniczkowa.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Planta'),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder(
          stream: FirestoreService().planta(widget.nombre),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData ||
                snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            var plantas = snapshot.data!.docs[0];
            var id = plantas.id;
            familiaCtrl.text = plantas['familia'];
            nombreCtrl.text = plantas['nombre'];
            imagenCtrl.text = plantas['image'];

            return Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: familiaCtrl,
                    decoration: InputDecoration(
                      label: Text('Familia'),
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                  TextFormField(
                    controller: nombreCtrl,
                    decoration: InputDecoration(
                      label: Text('Nombre'),
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                  TextFormField(
                    controller: imagenCtrl,
                    decoration: InputDecoration(
                      label: Text('Imagen'),
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 214, 188, 73)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            // Change your radius here
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      child: Text('Editar Planta'),
                      onPressed: () {
                        if (imagenCtrl.text.trim() != "") {
                          FirestoreService().editar(
                            id,
                            familiaCtrl.text.trim(),
                            nombreCtrl.text.trim(),
                            imagenCtrl.text.trim(),
                          );
                        } else {
                          FirestoreService().editar(
                            id,
                            familiaCtrl.text.trim(),
                            nombreCtrl.text.trim(),
                            noimage,
                          );
                        }
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
