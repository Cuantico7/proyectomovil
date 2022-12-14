import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/modelos/usuarios.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UsuarioRegistrarFb{

  Future<String?> registrarUsuario(String email, String password) async{

    try{
      final credencial = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return credencial.user?.uid;
    } on FirebaseAuthException catch(e){
      return e.code;
    } on FirebaseException catch(e){
      return e.code;
    }
  }


  Future<String> crearUsuario(Usuario usuario) async{

    try{
      var documento = await FirebaseFirestore.instance.collection("usuario").doc(usuario.id).set(usuario.convertir());
      return usuario.id;
    }on FirebaseException catch(e){
      return e.code;
    }


  }

}


