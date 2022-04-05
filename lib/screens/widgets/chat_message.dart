import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    Key? key,
    required this.message,
    required this.id,
    
  }) : super(key: key);

  final String message;
  final String id;
  

  @override
  Widget build(BuildContext context) {
    return id == '123'
        ? Align(
            alignment: Alignment.centerRight,
            child: BounceInUp(
              
              child: Container(
                margin: const EdgeInsets.only(left: 50),
                child: _MyMessage(
                  text: message,
                  isMe: true,
                  txtColor: Colors.white,
                  bgColor: Colors.blueAccent,
                ),
              ),
            ),
          )
        : Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(right: 50),
              child: _MyMessage(
                text: message,
                isMe: false,
                txtColor: Colors.black87,
                bgColor: const Color.fromARGB(255, 216, 216, 216),
              ),
            ),
          );
  }
}

class _MyMessage extends StatelessWidget {
  const _MyMessage({
    Key? key,
    required this.text,
    required this.bgColor,
    required this.txtColor,
    required this.isMe,
  }) : super(key: key);

  final String text;
  final Color bgColor;
  final Color txtColor;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor, //Colors.blueAccent,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft: Radius.circular(isMe ? 12 : 0),
          bottomRight: Radius.circular(isMe ? 0 : 12),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: txtColor, fontSize: 16),
      ),
    );
  }
}
