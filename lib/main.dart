import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/constants.dart';
import '/screens/chat_screen.dart';
import '/providers/models_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ModelsProvider())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ChatGPT',
          theme: ThemeData(
            primaryTextTheme: Typography.whiteCupertino,
            primarySwatch: Colors.green,
            useMaterial3: true,
            scaffoldBackgroundColor: scaffoldBackgroundColor,
            cardColor: cardColor,
            appBarTheme: const AppBarTheme(color: cardColor),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(
                color: Colors.white,
              ),
              bodySmall:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          home: const ChatScreen()),
    );
  }
}
