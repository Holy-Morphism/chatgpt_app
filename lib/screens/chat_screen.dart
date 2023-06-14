import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _istyping = true;
  late TextEditingController textInput;
  @override
  void initState() {
    textInput = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChatGPT'), centerTitle: true, actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            ))
      ]),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return Text('Heloo');
                }),
                itemCount: 6,
              ),
            ),
            if (_istyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: textInput,
                      onSubmitted: (value) {},
                      decoration: const InputDecoration.collapsed(
                          hintText: 'How can I help you ?',
                          hintStyle: TextStyle(color: Colors.grey)),
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ))
                  ],
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
