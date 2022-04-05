import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Labels extends StatelessWidget {
  final String titleTxt;
  final String buttonTxt;
  final String route;

  const Labels({
    Key? key,
    required this.buttonTxt,
    required this.titleTxt,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titleTxt,
          style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          child: Text(
            buttonTxt,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => context.push(route),
        ),
      ],
    );
  }
}
