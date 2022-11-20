import 'package:flutter/material.dart';
import 'cartagena_page.dart';
import 'vistas/vistaprincipal.dart';
import 'vistas/vistalogin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'vistas/splash.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COLOMBIA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/pantallaprincipal1.jpg")
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child:SplashPage()
          ),
        ),
      )
    );
  }
}

