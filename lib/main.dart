import 'package:chat_app/Screens/chat_details.dart';
import 'package:flutter/material.dart';
import 'Screens/main_screen.dart';
import 'Screens/profile.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.pink,
          selectionColor: Colors.grey,
        ),
      ),
      home: const MainScreen(),
      routes: {
        'Chats': (context) => const MainScreen(),
        'Chat Details': (context) => ChatDetail(Data.chatList[0]),
        'Profile': (context) => Profile(),
      },
      // home: MainScreen(),
    );
  }
}
