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
  TextEditingController imagenCtrl = TextEditingController();
  String noimage =
      'https://treehouse.co/uploads/szeflera-wyjatkowa-roslina-doniczkowa.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Producto'),
        backgroundColor: Colors.green,
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
                controller: imagenCtrl,
                decoration: InputDecoration(
                  label: Text('Imagen'),
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 214, 188, 73)),
                  child: Text('Agregar Planta'),
                  onPressed: () {
                    if (imagenCtrl.text.trim() != "") {
                      FirestoreService().agregar(
                        familiaCtrl.text.trim(),
                        nombreCtrl.text.trim(),
                        imagenCtrl.text.trim(),
                      );
                    } else {
                      FirestoreService().agregar(
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
        ),
      ),
    );
  }
}
