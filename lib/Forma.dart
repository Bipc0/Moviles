import 'package:flutter/material.dart';

class Forma extends StatelessWidget {
 // const Forma({Key? key}) : super(key: key);

late String _image, _Nombre, _Familia;

Forma({String? image, String? Nombre, String? Familia}){
  this._image =image!;
  this._Nombre = Nombre!;
  this._Familia = Familia!;
}
  @override
  Widget build(BuildContext context) {
    return  Container(
              height: 320,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 242, 244), borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/$_image'),
                  ),
                  Container(
                   child: Column(
                    children: [
                      Text('$_Nombre',style: TextStyle(fontSize: 24,color: Colors.deepPurple),),
                      Text('Precio \$ $_Familia',style: TextStyle(fontSize: 24,color: Colors.red),),
                    ],
                   ), 
                  ),

                ],
              ),

            );
  }
}