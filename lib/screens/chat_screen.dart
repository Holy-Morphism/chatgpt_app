import 'package:chatgptapp/constants/constants.dart';
import 'package:chatgptapp/services/api_service.dart';
import 'package:chatgptapp/services/assets_manager.dart';
import 'package:chatgptapp/widgets/chat.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/services.dart';

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
      appBar: AppBar(
          title: Image.asset(
            AssetManager.openailogo,
            height: 30,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  await Services.bottomSheet(context);
                },
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
                  return Chat(
                    messege: chatData[index]['answer'] as String,
                    question: chatData[index]['question'] as String,
                  );
                }),
                itemCount: chatData.length,
              ),
            ),
            if (_istyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
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
                        onPressed: () async {
                          try {
                            await ApiService.getModels();
                          } catch (e) {
                            print('error : $e');
                          }
                        },
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
