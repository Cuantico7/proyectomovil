import 'package:flutter/material.dart';
import 'dart:convert';

class Usuario{
  var _id;
  var _nombre;
  var _apellido;
  var _celular;
  var _email;
  var _nacionalidad;
  var _password;

  Usuario(this._id, this._nombre, this._apellido, this._celular, this._email,
      this._nacionalidad, this._password);



  Usuario.fromJson(Map<String, dynamic> data)
      : _id= data['id'],
        _nombre=data["nombre"],
        _apellido=data["apellido"],
        _celular=data["celular"],
        _email=data["correo"],
        _nacionalidad=data["nacionalidad"],
        _password=data["password"];

  Map<String, dynamic> convertir() =>{
    'id':_id,
    "nombre":_nombre,
    "apellido":_apellido,
    "celular":_celular,
    "correo":_email,
    "nacionalidad":_nacionalidad,
    "password":_password,
  };


  get passw_passwordord => _password;

  set password(value) {
    _password = value;
  }

  get nacionalidad => _nacionalidad;

  set nacionalidad(value) {
    _nacionalidad = value;
  }

  get correo => _email;

  set correo(value) {
    _email = value;
  }

  get celular => _celular;

  set celular(value) {
    _celular = value;
  }

  get apellido => _apellido;

  set apellido(value) {
    _apellido = value;
  }

  get nombre => _nombre;

  set nombre(value) {
    _nombre = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }
}