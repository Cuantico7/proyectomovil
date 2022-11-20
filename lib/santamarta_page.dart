import 'package:flutter/material.dart';

class SantaMarta extends StatelessWidget {
  const SantaMarta({Key? key}) : super(key: key);

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
                          "images/playa blanca.jpg",
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
                            "Santa Marta es conocida desde la época de La Colonia como la perla de América debido a sus maravillosos paisajes naturales, sus aguas cristalinas y sus playas paradisíacas",
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
