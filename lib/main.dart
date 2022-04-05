import 'package:chat_app/navigation/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final Routes _router = Routes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Chat app',
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.router. routeInformationParser,
      routerDelegate: _router.router.routerDelegate,
    );
  }
}
