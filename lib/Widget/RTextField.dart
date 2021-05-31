import 'dart:ffi';

import 'package:bundle_test/Utils/Colorss.dart';
import 'package:flutter/material.dart';


class RTextField extends StatefulWidget {

  RTextField(
      {
        this.height_value,
        this.controller,
        this.hint_text,
        this.borderColor,
        this.isPassword,
        this.distance_right = 25.0,
        this.label_text
      });

  TextEditingController controller;
  String hint_text;
  String label_text;
  double distance_right;
  bool isPassword;
  bool readOnly;
  double height_value;
  Color borderColor;

  @override
  State<StatefulWidget> createState() {
    return TextFieldState();
  }
}

class TextFieldState extends State<RTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:widget.height_value,
      margin: EdgeInsets.fromLTRB(25.0, 10,
          null == widget.distance_right ? 25 : widget.distance_right, 8),
      child: TextFormField(
        controller:widget.controller,
        cursorColor: Colors.black,
        obscureText:widget.isPassword,
        keyboardType:TextInputType.text,
        decoration:InputDecoration(
            hintText: widget.hint_text,
            hintStyle: TextStyle(
                fontFamily: "Montserrat", fontWeight: FontWeight.w200 , color:Colors.black),
            labelText:null,
            labelStyle: TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: widget.borderColor == null ? BorderSide(color: Colors.transparent, width: 1.2):BorderSide(color: Colors.black,width: 1.2)),
            focusedBorder: OutlineInputBorder(
                borderSide:widget.borderColor == null ?  BorderSide(color: Colors.transparent, width: 1.0):BorderSide(color: Colors.black,width: 1.2))),
      ),
    );
  }
}
