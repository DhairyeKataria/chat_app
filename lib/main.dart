import 'package:chat_app/Screens/chat_details.dart';
import 'package:chat_app/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'Screens/main_screen.dart';
import 'Screens/profile.dart';
import 'Screens/search_screen.dart';
import 'Screens/signup_screen.dart';
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
      // Change home to SignUpScreen()
      home: LogInScreen(),
      routes: {
        'main': (context) => const MainScreen(),
        'Chat Details': (context) => ChatDetail(Data.chatList[0]),
        'Profile': (context) => Profile(),
        'LogIn': (context) => LogInScreen(),
        'SignUp': (context) => SignUpScreen(),
        'search': (context) => const SearchScreen(),
      },
      // home: MainScreen(),
    );
  }
}
