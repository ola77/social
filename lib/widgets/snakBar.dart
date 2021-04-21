//
//
//
//
//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharous/widgets/standared_text.dart';



void showSnackBar(BuildContext context , String message){
  Scaffold.of(context).showSnackBar(SnackBar(
    content: TextA(
      text: message,
      color: Colors.white,
    ),
  ));
}
