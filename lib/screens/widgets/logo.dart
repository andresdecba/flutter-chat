import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String text;
  const Logo({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          child: Image.asset('assets/tag-logo.png'),
        ),
        const SizedBox(height: 18),
        Text(
          text,
          style: const TextStyle(fontSize: 28),
        )
      ],
    );
  }
}
