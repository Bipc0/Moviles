import 'package:flutter_application_1/services/firestore_service.dart';
import 'package:flutter/material.dart';

class ProductosAgregarPage extends StatefulWidget {
  ProductosAgregarPage({Key? key}) : super(key: key);

  @override
  State<ProductosAgregarPage> createState() => _ProductosAgregarPageState();
}

class _ProductosAgregarPageState extends State<ProductosAgregarPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController familiaCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController regionCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: familiaCtrl,
                decoration: InputDecoration(
                  label: Text('Familia'),
                ),
              ),
              TextFormField(
                controller: nombreCtrl,
                decoration: InputDecoration(
                  label: Text('Nombre'),
                ),
              ),
              TextFormField(
                controller: regionCtrl,
                decoration: InputDecoration(
                  label: Text('Region'),
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                  child: Text('Agregar Planta'),
                  onPressed: () {
                    FirestoreService().agregar(
                      familiaCtrl.text.trim(),
                      nombreCtrl.text.trim(),
                      regionCtrl.text.trim(),
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
