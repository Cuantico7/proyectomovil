import 'package:flutter/material.dart';
import 'package:untitled1/cartagena_page.dart';
import 'package:untitled1/repositorio/registrousuariofirebase.dart';
import 'tituloprincipal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'bdregistrarusuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class RegistrarUsuario extends StatefulWidget {
  const RegistrarUsuario({Key? key}) : super(key: key);

  @override
  State<RegistrarUsuario> createState() => _RegistrarUsuarioState();
}

class _RegistrarUsuarioState extends State<RegistrarUsuario> {


  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UsuarioRegistrarFb objetoregfirebase =UsuarioRegistrarFb();
  final usuario = TextEditingController();
  final clave = TextEditingController();
  String usu = "";
  String cla = "";

  void registrarusuarios()async{

    usu = usuario.text;
    cla = clave.text;
    final datos =await objetoregfirebase.registrarUsuario(usu, cla);
    if(datos =="weak-password"){
      Fluttertoast.showToast(msg: "La contraseña debe tener minimo 6 caracteres",toastLength:Toast.LENGTH_SHORT,gravity:ToastGravity.CENTER );
    }
    else if(datos=="email-already-in-use"){
      Fluttertoast.showToast(msg: "El email ya esta existe",toastLength:Toast.LENGTH_SHORT,gravity:ToastGravity.CENTER );
    }
    else if(datos=="invalid-email"){
      Fluttertoast.showToast(msg: "El email no es valido",toastLength:Toast.LENGTH_SHORT,gravity:ToastGravity.CENTER );
    }
    else if(datos=="network-request-failed"){
      Fluttertoast.showToast(msg: "Sin internet",toastLength:Toast.LENGTH_SHORT,gravity:ToastGravity.CENTER );

    }
    else  {
      var pk=datos;
      print("Datos de la PK${pk}");
      Fluttertoast.showToast(msg: "Datos registrados",toastLength:Toast.LENGTH_SHORT,gravity:ToastGravity.CENTER );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Bdregistrarusuario(pk)));
    }
    print(datos);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo,
            body: Padding(
              padding: EdgeInsets.all(2),
              child: ListView(
                children: [
                  Container(
                    child: Titulo(),
                    margin: EdgeInsets.only(bottom: 30),

                  ),
                  Container(
                    child: Text("Login"),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Usuario(),
                  Clave(),
                  BtnLogin(),

                ],
              ),
            )
        )
    );
  }

  Container Usuario(){
    return Container(
      color:Colors.amber,
      width: 200,
      height: 100,
      child: TextField(
        style: (TextStyle(fontSize: 20)),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Correo"
        ),
        controller: usuario,
      ),


    );

  }


  Container Clave(){
    return Container(
      color:Colors.white,
      width: 200,
      height: 100,
      child: TextField(
        style: (TextStyle(fontSize: 20)),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Contraseña"
        ),
        controller: clave,
      ),


    );

  }
  ElevatedButton BtnLogin(){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),

          backgroundColor: Colors.green

      ),

      child: Text("Registrar",
        style: TextStyle(
            fontSize: 12,
            color: Colors.white
        ),
      ),
      onPressed: (){
        registrarusuarios();
      },

    );
  }




}



