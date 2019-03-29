import 'package:flutter/material.dart';
class UpdateField extends StatelessWidget {
  final initialValue;
  final validator;
  final onSaved;

  UpdateField({this.initialValue, this.validator,this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: initialValue,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
