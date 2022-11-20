import 'package:flutter/material.dart';
import 'package:untitled1/cartagena_page.dart';
import 'package:untitled1/santamarta_page.dart';
import 'package:untitled1/barranquilla_page.dart';


class Ciudades extends StatefulWidget {
  const Ciudades({Key? key}) : super(key: key);

  @override
  State<Ciudades> createState() => _CiudadesState();
}

class _CiudadesState extends State<Ciudades> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body:ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: const Text(
                      "Region Caribe",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset(
                        "images/santamarta.jpg",
                        width: 350,
                      )
                  ),
                  Container(
                    child:Boton_uno() ,

                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset(
                        "images/crucerocartagena.jpg",
                        width: 350,
                      )
                  ),
                  Container(
                    child:Boton_dos() ,

                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset(
                        "images/barranquilla.jpg",
                        width: 350,
                      )
                  ),
                  Container(
                    child:Boton_tres() ,

                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }

  ElevatedButton Boton_uno() {
    return ElevatedButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.blueAccent
      ),
      child: Text(
        "Santa Marta  ... Ir",
        style: TextStyle(
            fontSize: 12, color: Colors.white),
      ),
      onPressed: (){
        Navigator.push((context), MaterialPageRoute(builder: (context)=>SantaMarta()));
      },
    );
  }


  ElevatedButton Boton_dos() {
    return ElevatedButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.blueAccent
      ),
      child: Text(
        "Cartagena  ... Ir",
        style: TextStyle(
            fontSize: 12, color: Colors.white),
      ),
      onPressed: (){
        Navigator.push((context), MaterialPageRoute(builder: (context)=>Cartagena()));
      },
    );
  }

  ElevatedButton Boton_tres() {
    return ElevatedButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.blueAccent
      ),
      child: Text(
        "Barranquilla  ... Ir",
        style: TextStyle(
            fontSize: 12, color: Colors.white),
      ),
      onPressed: (){
        Navigator.push((context), MaterialPageRoute(builder: (context)=>Barranquilla()));
      },
    );
  }
}


