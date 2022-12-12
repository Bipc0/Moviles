import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/AdminPage.dart';
import 'package:flutter_application_1/Page/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String role = 'user';
  final formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 148, 43),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 200, 255, 202),
              border: Border.all(
                color: Colors.lightGreen,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Inicio de sesión',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  TextFormField(
                    controller: emailCtrl,
                    decoration: InputDecoration(
                      label: Text('Email'),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: passwordCtrl,
                    decoration: InputDecoration(
                      label: Text('Contraseña'),
                    ),
                    obscureText: true,
                  ),

                  //BOTON LOGIN
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 214, 188, 73)),
                      child: Text('INICIAR SESIÓN'),
                      onPressed: () => login(),
                    ),
                  ),

                  //MENSAJES ERROR
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    try {
      //intentar hacer login
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
      );

      //si llego acá las credenciales estaban ok
      //guardar user email
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('userEmail', userCredential.user!.email.toString());

      //redirigir al home

      var firebaseUser = await FirebaseAuth.instance.currentUser!;

      if (firebaseUser.uid == 'rBMZ3Tfo92ZnKnhXJmSKmR67VPF2') {
        // if user has a collection, go to user screens
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AdminPage()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (ex) {
      //si el login no es válido llegamos acá
      switch (ex.code) {
        case 'user-not-found':
          error = 'Usuario no existe';
          break;
        case 'wrong-password':
          error = 'Contraseña incorrecta';
          break;
        case 'user-disabled':
          error = 'Cuenta desactivada';
          break;
        default:
          error = 'Campos vacios';
          break;
      }
      setState(() {});
    }
  }
}
