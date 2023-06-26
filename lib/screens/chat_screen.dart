import 'package:chatgptapp/models/chat_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';
import '../providers/models_provider.dart';
import '../services/api_service.dart';
import '../services/assets_manager.dart';
import '../widgets/chat.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _istyping = false;
  late TextEditingController textInput;
  late FocusNode focusNode;
  late ScrollController _listController;
  @override
  void initState() {
    _listController = ScrollController();
    textInput = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    textInput.dispose();
    focusNode.dispose();
    _listController.dispose();
    super.dispose();
  }

  List<ChatModel> chatList = [];
  @override
  Widget build(BuildContext context) {
    final models = Provider.of<ModelsProvider>(context);
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
                controller: _listController,
                itemBuilder: ((context, index) {
                  return Chat(
                    messege: chatList[index].message,
                    index: chatList[index].index,
                  );
                }),
                itemCount: chatList.length,
              ),
            ),
            if (_istyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),
            ],
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    focusNode: focusNode,
                    style: const TextStyle(color: Colors.white),
                    controller: textInput,
                    onSubmitted: (value) async {
                      await sendMessageFCT(models: models);
                    },
                    decoration: const InputDecoration.collapsed(
                        hintText: 'How can I help you ?',
                        hintStyle: TextStyle(color: Colors.grey)),
                  )),
                  IconButton(
                      onPressed: () async {
                        await sendMessageFCT(models: models);
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setScroll() {
    _listController.animateTo(_listController.position.maxScrollExtent,
        duration: const Duration(seconds: 2), curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT({required models}) async {
    try {
      setState(() {
        _istyping = true;
        chatList.add(ChatModel(message: textInput.text, index: 0));
        focusNode.unfocus();
      });
      chatList.addAll(await ApiService.getResponse(
          message: textInput.text, model: models.getCurrentModel));
      setState(() {});
    } catch (e) {
      print('error : $e');
    } finally {
      setState(() {
        _istyping = false;
        textInput.clear();
        setScroll();
      });
    }
  }
}
