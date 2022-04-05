import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/loading_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:chat_app/screens/usuarios_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

 class Routes {

   final GoRouter router = GoRouter(
    initialLocation: '/chatScreen',

    routes: <GoRoute>[
      GoRoute(
        name: 'loading', // opcional: poner un nombre
        path: '/loadingScreen', // path
        builder: (BuildContext context, GoRouterState state) => const LoadingScreen(),
      ),
      GoRoute(
        name: 'login',
        path: '/loginScreen',
        builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
        
      ),
      GoRoute(
        name: 'register',
        path: '/registerScreen',
        builder: (BuildContext context, GoRouterState state) => const RegisterScreen(),
        
      ),
      GoRoute(
        name: 'usuarios',
        path: '/usuariosScreen',
        builder: (BuildContext context, GoRouterState state) => const UsuariosScreen(),        
      ),
      GoRoute(
        name: 'chat',
        path: '/chatScreen',
        builder: (BuildContext context, GoRouterState state) => ChatScreen(),        
      ),
    ],
  );
   
 }




class EjemplosDeNavegar extends StatelessWidget {
  const EjemplosDeNavegar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('go'),
      onPressed: () {
        // navegar opc 1: por el path de la ruta
        GoRouter.of(context).go('/loginScreen');

        // navegar opc 2: por el nombre de la ruta o el path
        context.goNamed('loading');

        // nagegar opc 3: pasar cosas -> ver docu https://gorouter.dev/parameters
        context.goNamed(
          'loading',                     // ruta o nombre d ela pantalla
          params: { 'id' : 'parametro'}, // pasar un parametro al path product/:id
          extra: 'any object'            // pasar un objeto  
        );
      },
    );
  }
}
