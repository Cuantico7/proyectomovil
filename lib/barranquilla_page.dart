import 'package:flutter/material.dart';



class Barranquilla extends StatelessWidget {
  const Barranquilla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
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
                        "Santa Marta",
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
                          "images/barranquilla.jpg",
                          width: 350,
                        )
                    ),
                    Container(
                      color: Color.fromARGB(8, 238, 244, 180),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: const [
                          Text(
                            "Barranquilla, también conocida como la ‘Arenosa’ o ‘Curramba la Bella’, es una de las principales ciudades de Colombia y un destino turístico de referencia para locales y extranjeros. Esta ciudad, donde el río Magdalena termina su largo recorrido, es cuna de grandes músicos, literatos y pintores. Además, es escenari…",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]
        ),
      );
  }


}

