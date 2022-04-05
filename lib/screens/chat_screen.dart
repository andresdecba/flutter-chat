import 'package:chat_app/screens/widgets/chat_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _txtController = TextEditingController();
  final _focusNode = FocusNode();
  bool _isTexting = false;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final List<ChatMessage> _messagesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 1,
        title: const Text('Juancito', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            //////////////////// CHAT
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: _messagesList.length,
                reverse: true,
                itemBuilder: (BuildContext context, int index) {
                  return _messagesList[index];
                },
              ),
            ),
            ///////////////////
            

            const Divider(),
            Container(
              color: Colors.white,
              child: TextField(
                onChanged: (String value) {
                  setState(() {
                    value.isEmpty ? _isTexting = false : _isTexting = true;
                  });
                },
                onSubmitted: _submit,
                controller: _txtController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: 'Escribe algo...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),

                  ///////////////////// ENVIAR
                  suffixIcon: IconTheme(
                    data: const IconThemeData(color: Colors.blueAccent),
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: _isTexting ? () => _submit(_txtController.text.trim()) : null,
                    ),
                  ),
                  ////////////////////
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _submit(String text) {
    if (text.isEmpty) return;
    setState(() {
      _messagesList.insert(0, ChatMessage(message: text, id: '123'));
      _isTexting = false;
    });
    _txtController.clear();
    _focusNode.requestFocus();
  }
}
