import 'package:flutter/material.dart';
class FormTextField extends StatelessWidget {
  final obsecure;
  final label;
  final icon;
  final hintText;
  final fontSize;
  final font;
  final fontFamily;
  final onSaved;
  final isEnable;
  final keyType;
  final valid;
  final maxlenght;

  FormTextField({this.obsecure=false, this.label, this.icon, this.hintText,
      this.fontSize, this.font, this.fontFamily, this.onSaved, this.isEnable,
      this.keyType,this.valid,this.maxlenght});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //maxLength: maxlenght,
      validator: valid,
      enabled: isEnable,
      keyboardType: keyType,
      onSaved: onSaved,
      style: TextStyle(color: Colors.white,decorationColor: Colors.white,),
      decoration: new InputDecoration(
          labelText: label,
          icon: new Icon(
            icon,
            color: Colors.white,
          ),
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: new UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.white)),
          focusedBorder: new UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.white)),
          errorStyle: new TextStyle(color: Colors.amber),
          errorBorder: new UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.amber)),
          focusedErrorBorder: new UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.amber)),
          contentPadding:
          const EdgeInsets.only(top: 15, right: 0, bottom: 20, left: 5)),
      obscureText: obsecure,
    );
  }
}
