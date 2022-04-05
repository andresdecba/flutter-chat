import 'package:chat_app/screens/widgets/button_blue.dart';
import 'package:chat_app/screens/widgets/customField.dart';
import 'package:chat_app/screens/widgets/labels.dart';
import 'package:chat_app/screens/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Logo(text: 'Messenger'),
                _Forms(),
                Labels(
                  titleTxt: '¿No tienes una cuenta?',
                  buttonTxt: '¡Crear una ahora!',
                  route: '/registerScreen',
                ),
                Text('Términos y condiciones de uso', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Forms extends StatefulWidget {
  const _Forms({Key? key}) : super(key: key);
  @override
  State<_Forms> createState() => _FormsState();
}

class _FormsState extends State<_Forms> {
  TextEditingController emailCtrlr = TextEditingController();
  TextEditingController passCtrlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          ///////////////////////
          /// email form ///
          ///////////////////////
          CustomField(
            hitText: 'email',
            icon: Icons.email,
            controller: emailCtrlr,
            inputType: TextInputType.emailAddress,
            isPass: false,
          ),
          const SizedBox(height: 16),

          ///////////////////////
          /// pass form ///
          ///////////////////////
          CustomField(
            hitText: 'password',
            icon: Icons.password,
            controller: passCtrlr,
            inputType: TextInputType.text,
            isPass: true,
          ),
          const SizedBox(height: 24),

          ///////////////////////
          /// button ///
          ///////////////////////
          ButtonBlue(
              text: 'Ingresar',
              action: () {
                print(emailCtrlr.text);
                print(passCtrlr.text);
              }),
        ],
      ),
    );
  }
}
