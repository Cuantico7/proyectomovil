import 'package:flutter/material.dart';

class Cartagena extends StatelessWidget {
  const Cartagena({Key? key}) : super(key: key);

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
                  "Cartagena",
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
                    "images/castillo.jpg",
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
                      "Cartagena de Indias es un Distrito Turístico y Cultural de inmenso patrimonio artístico e histórico que detalla abiertamente a la ciudad como el puerto más importante del Caribe y punto desde el cual salían del nuevo mundo las grandes riquezas de Suramérica hacia el continente europeo en enormes y fabulosos buques y galeones que en alta mar era el elemento más apetecido por los piratas y que hicieron de esta historia la más extraordinaria leyenda.",
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
