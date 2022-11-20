import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/repositorio/registrousuariofirebase.dart';
import 'package:untitled1/vistas/tituloprincipal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/modelos/usuarios.dart';
import 'package:untitled1/vistas/vistalogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Bdregistrarusuario extends StatefulWidget {

  final idusuario;
  const Bdregistrarusuario(this.idusuario,{Key? key}) : super(key: key);

  @override
  State<Bdregistrarusuario> createState() => _BdregistrarusuarioState();
}
class _BdregistrarusuarioState extends State<Bdregistrarusuario> {

  final _nombre = TextEditingController();
  final _apellido = TextEditingController();
  final _correo = TextEditingController();
  final _celular = TextEditingController();
  final _nacionalidad = TextEditingController();
  UsuarioRegistrarFb obfirebase = UsuarioRegistrarFb();
  void _registrarusuario(Usuario usuario)async{
    //var resultado = await obfirebase.crearusuario(usuario);
    Fluttertoast.showToast(msg: "datos guardados",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>Login())
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6,vertical: 8),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.only(top: 100
                  ),
                  child: Titulo(),


                ),
                TextField(
                  controller: _nombre,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _apellido,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Apellido",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _celular,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Celular",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _correo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Correo",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _nacionalidad,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nacionalidad",
                  ),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)

                    ),
                    backgroundColor: Colors.green

                    ),
                  onPressed: (){
                    final idfireb = widget.idusuario;
                    var usuario=Usuario("", _nombre.text, _apellido.text, _celular.text, _correo.text, _nacionalidad.text,"");
                    _registrarusuario(usuario);
                  },
                  child: Text("Registrarte"),


                ),






              ],

            ),
          )
        ),
      ),
    );
  }
}
