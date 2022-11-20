import 'package:flutter/material.dart';

class Titulo extends StatefulWidget {
  const Titulo({Key? key}) : super(key: key);

  @override
  State<Titulo> createState() => _TituloState();
}

class _TituloState extends State<Titulo> {
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //margin: EdgeInsets.all(60),
          margin: EdgeInsets.only(top:40 ),
          width: 120,
          height: 120,
          //color: Colors.green,
          child: Text("VIAJANDO APP",style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Colors.blue),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          //margin: EdgeInsets.all(20),
          width: 120,
          height: 100,
          //color: Colors.indigo,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("images/logo.png")
              )
          ),
        ),
      ],
    );
  }
}
