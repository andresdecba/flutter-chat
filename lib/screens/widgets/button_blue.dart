import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  final VoidCallback action;
  final String text;

  const ButtonBlue({Key? key, required this.action, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blueAccent,
        shape: const StadiumBorder(),
      ),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(text),
      ),
      onPressed: action,
    );
  }
}
