import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../services/assets_manager.dart';

class Chat extends StatelessWidget {
  const Chat({super.key, required this.messege, required this.index});
  final String messege;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return Material(
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
                messege,
                style: const TextStyle(color: Colors.white),
              ))
            ],
          ),
        ),
      );
    } else {
      return Material(
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
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  repeatForever: false,
                  displayFullTextOnTap: true,
                  totalRepeatCount: 1,
                  animatedTexts: [TyperAnimatedText(messege)],
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
