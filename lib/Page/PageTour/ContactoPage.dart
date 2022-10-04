import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/PageTour/Form.dart';

class ConPage extends StatelessWidget {
  const ConPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacto'),
        backgroundColor: const Color(0xffd9a76c),
        centerTitle: true,
      ),
      body: Contacto(),
    );
  }
}
