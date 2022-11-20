import 'package:flutter/material.dart';
import 'package:untitled1/repositorio/registrousuariofirebase.dart';
//import 'package:untitled/pages/home_page.dart';
//import 'package:untitled/pages/login_page.dart';
//import 'package:paseador_mascotas/repositorio/usuario_registrar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled1/repositorio/registrousuariofirebase.dart';
import 'package:untitled1/vistas/tituloprincipal.dart';
import 'vistalogin.dart';
import 'vistalogin.dart';
import 'package:untitled1/modelos/usuarios.dart';
import 'vistalogin.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegistrarPage extends StatefulWidget {
  const RegistrarPage({Key? key}) : super(key: key);

  @override
  _RegistrarPageState createState() => _RegistrarPageState();
}

enum Genero {Femenino,Masculino}

class _RegistrarPageState extends State<RegistrarPage> {
  late  mensaje msg;
  final nombres=TextEditingController();
  final apellidos=TextEditingController();
  final email=TextEditingController();
  final celular=TextEditingController();
  final nacionalidad=TextEditingController();
  final password=TextEditingController();
  final passwordConf=TextEditingController();




  //archivo registrousuariofirebase tiene la clase UsuarioRegistrarFb
  UsuarioRegistrarFb usuario = UsuarioRegistrarFb();

  void guardarusuario(Usuario usuaNew) async {
    var resultado = await usuario.registrarUsuario(email.text, password.text);


    if(resultado=="invalid-email"){
      msg.mostrarMensaje("El formato del Email no es correcto.");
    }else
    if(resultado=="weak-password"){
      msg.mostrarMensaje("La contraseña debe tener minimo 6 caracteres.");
    }else
    if(resultado=="unknown"){
      msg.mostrarMensaje("Complete los datos.");
    }else
    if(resultado=="network-request-failed"){
      msg.mostrarMensaje("Revise la conexion a internet.");
    }else{
      usuaNew.id=resultado;
      registrarUsuario(usuaNew);
      msg.mensajeOk("Usuario registrado exitosamente, inicie seccion");

    }
    
  }

  void registrarUsuario(Usuario usuNew) async{
    var id= await usuario.crearUsuario(usuNew);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login()));
  }

  void traerDatos(){

    setState(() {
      if(password.text == passwordConf.text){
        if(nombres.text.isNotEmpty && apellidos.text.isNotEmpty && email.text.isNotEmpty &&
      password.text.isNotEmpty && passwordConf.text.isNotEmpty){
          var usuNew= Usuario("", nombres.text, apellidos.text, celular.text, email.text, nacionalidad.text, password.text);
          guardarusuario(usuNew);
        }
        else{
          msg.mostrarMensaje("Datos Incompletos.");
        }
      }else{
        msg.mostrarMensaje("Las contraseñas no coinciden.");
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    msg= mensaje(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/fondonegro.jpeg"), fit: BoxFit.cover)),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: SingleChildScrollView(
                child: Center(
                    child: Column(children: [
                      Container(
                          child: Titulo(),
                      ),
                      TextFormField(
                        controller: nombres,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            labelText: "Nombres",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: apellidos,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            labelText: "Apellidos",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: "Correo Electronico",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.email_outlined, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: celular,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: "Celular",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.email_outlined, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: nacionalidad,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            labelText: "Nacionalidad",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person, color: Colors.white,)
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: password,
                        //keyboardType: TextInputType.emailAddress,
                        //maxLength: 8,
                        decoration: const InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.vpn_key_sharp, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordConf,
                        //keyboardType: TextInputType.emailAddress,
                        //maxLength: 8,
                        decoration: const InputDecoration(
                            labelText: "Confirmar Password",
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.vpn_key_sharp, color: Colors.white,)
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.black12,
                              fixedSize: const Size(200, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              textStyle: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20)),
                          onPressed:(){
                            traerDatos();

                          },
                          child: const Text("Registrarse"))
                    ])))),
      ),
    );
  }
}