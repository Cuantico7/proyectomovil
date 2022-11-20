import 'package:flutter/material.dart';
import 'package:untitled1/vistas/tituloprincipal.dart';
import 'package:untitled1/vistas/vistaprincipal.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  /*funcion para inicilaizar el metodo Future de la pantalla del Splash*/
  void initState(){
    pasarPage();
    super.initState();
  }

/*Metodo de 3 segundos para cambiar de la pnatalla del splash
a la pantallla principal*/
  Future<void> pasarPage() async{
    Future.delayed(const Duration(seconds: 3), () async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const VistaPrincipal ()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              child: Titulo(),

            ),
          ),
          Container(
            child: Text(
              "Tu compañero de viajes",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
