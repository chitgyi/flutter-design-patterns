import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String hintText;
  EditText({
    this.inputType,
    this.hintText = '',
    @required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
