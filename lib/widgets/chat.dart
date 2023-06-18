import 'package:chatgptapp/services/assets_manager.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key, required this.messege, required this.question});
  final String messege;
  final String question;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.person),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Text(
                  question,
                  style: const TextStyle(color: Colors.white),
                ))
              ],
            ),
          ),
        ),
        Material(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AssetManager.chatGPTLogo,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Text(
                  messege,
                  style: const TextStyle(color: Colors.white),
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
