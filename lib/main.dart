import 'package:chatgptapp/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import 'constants/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ChatGPT',
        theme: ThemeData(
            primaryTextTheme: Typography.whiteCupertino,
            primarySwatch: Colors.green,
            useMaterial3: true,
            scaffoldBackgroundColor: scaffoldBackgroundColor,
            cardColor: cardColor,
            appBarTheme: const AppBarTheme(color: cardColor)),
        home: const ChatScreen());
  }
}
