import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/vistas/tituloprincipal.dart';
import 'package:untitled1/vistas/vistaprincipal.dart';
import 'tituloprincipal.dart';
import 'package:untitled1/cartagena_page.dart';
import 'vistaCiudades.dart';
import 'vistaregistrarusuario2.dart';
import 'vistaregistrarusuario.dart';
import 'vistaciudades2.dart';





class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email=TextEditingController();
  final password=TextEditingController();
  FirebaseAuth auth= FirebaseAuth.instance;
  late final mensaje msg;

  void validarUsuario() async{

    try {

      final user = await auth.signInWithEmailAndPassword(email: email.text, password: password.text);
      if(user != null){
        msg.mensajeOk("Bienvenido!!!!");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Ciudades()));
      }
    } on FirebaseAuthException catch (e) {
      //most-rarMensaje("${e.code}");

      if(e.code=="invalid-email"){
        msg.mostrarMensaje("El formato del Email no es correcto.");
      }else
      if(e.code=="user-not-found"){
        msg.mostrarMensaje("El usuario no esta registrado.");
      }else
      if(e.code=="wrong-password"){
        msg.mostrarMensaje("Contraseña Incorrecta.");
      }else
      if(e.code=="unknown"){
        msg.mostrarMensaje("Complete los datos.");
      }else
      if(e.code=="network-request-failed"){
        msg.mostrarMensaje("Revise la conexion a internet.");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    msg= mensaje(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 50),
          child: Center(
            child: Column(
              children: [
                Container(
                  child: Titulo(),
                ),
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      labelText: "Correo Electronico",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.email_outlined, color: Colors.blue, size: 24)
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  //keyboardType: TextInputType.emailAddress,
                  //maxLength: 8,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.vpn_key_sharp, color: Colors.blue, size: 24),

                  ),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.blue)
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrarPage()));
                    },

                    child: const Text("Registrarse")
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        shadowColor: Colors.black26,
                        textStyle: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        )
                    ),
                    onPressed:(){
                      validarUsuario();
                    },
                    child: const Text("Ingresar"))

              ],
            ),
          ),
        ),
      ),
    );
  }

}
class mensaje{

  late BuildContext context;

  mensaje(this.context);


  void mostrarMensaje(String mensaje){
    final pantalla=ScaffoldMessenger.of(context);
    pantalla.showSnackBar(
        SnackBar(
          content: Text(mensaje, style: const TextStyle(fontSize: 10),),
          backgroundColor: const Color(0xFFD50000),
          duration: const Duration(seconds: 5),
          action: SnackBarAction(
              label: 'Registrese',
              onPressed: (){
                pantalla.hideCurrentSnackBar;
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrarUsuario()));
              }

          ),
        )
    );
  }

  void mensajeOk(String mensaje){
    final pantalla=ScaffoldMessenger.of(context);
    pantalla.showSnackBar(
        SnackBar(
          content: Text(mensaje, style: const TextStyle(fontSize: 10),),
          backgroundColor: const Color(0xFF4CAF50),
          duration: const Duration(seconds: 5),
        )
    );
  }
}
