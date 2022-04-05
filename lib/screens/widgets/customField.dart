import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {

  final String hitText;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool isPass;
  const CustomField({
    Key? key,
    required this.hitText,
    required this.icon,
    required this.controller,
    required this.inputType,
    required this.isPass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPass ,
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        prefix: Icon(
          icon,
          color: Colors.grey,
        ),
        hintText: hitText,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey, width: 2),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
