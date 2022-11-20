import 'dart:ui';
import 'bdregistrarusuario.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/cartagena_page.dart';
import 'package:untitled1/vistas/vistalogin.dart';
import 'package:untitled1/vistas/vistaregistrarUsuario.dart';
import 'tituloprincipal.dart';
import 'vistaregistrarusuario2.dart';
import 'somos.dart';

class VistaPrincipal extends StatefulWidget {
  const VistaPrincipal({Key? key}) : super(key: key);

  @override
  State<VistaPrincipal> createState() => _VistaPrincipalState();
}

class _VistaPrincipalState extends State<VistaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 250),
            child: Titulo(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                color: Colors.white,
                width: 90,
                height: 50,
                child: Boton_uno(),
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                color: Colors.white,
                width: 90,
                height: 50,
                child: Boton_dos(),
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                color: Colors.white,
                width: 95,
                height: 50,
                child: Boton_tres(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton Boton_uno() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),

          backgroundColor: Colors.blueAccent
      ),
      child: Text(
        "somos",
        style: TextStyle(fontSize: 10, color: Colors.white),
      ),
      onPressed: () {

        Navigator.push(context, MaterialPageRoute(builder:(context)=>Somos()));
      },
    );
  }

  ElevatedButton Boton_dos() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),

          backgroundColor: Colors.blueAccent
      ),
      child: Text(
        "Ingresar",
        style: TextStyle(fontSize: 10, color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder:(context)=>Login()));
      },
    );
  }

  ElevatedButton Boton_tres() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),

          backgroundColor: Colors.blueAccent
      ),
      child: Text(
        "Registrarse",
        style: TextStyle(
            fontSize: 10, color: Colors.white),
      ),
      onPressed: ()async{
       Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrarPage()));
      },
    );
  }
}
