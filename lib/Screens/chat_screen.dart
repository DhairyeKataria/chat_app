// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chat_app/Screens/search_screen.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/data.dart';
import 'package:provider/provider.dart';
import '../components/chat_tile.dart';
import '../components/search_bar.dart';
import '../models/chat_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Chat> chatList = [];
  int times = 0;

  void fetchContacts() async {
    // //
    List<Chat> _chatList = [];
    int length = 0;
    final currentUser =
        Provider.of<Data>(context, listen: true).currentUser.username;

    final response = await http.get(Uri.parse('$url/contacts/$currentUser'));
    length = jsonDecode(response.body).length;

    for (int i = 0; i < length; i++) {
      Chat chat = Chat.fromJson(jsonDecode(response.body)[i]);
      if (chat.name != null) {
        _chatList.add(chat);
      }
    }

    print(response.body);
    Provider.of<Data>(context, listen: false).setChatList(_chatList);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (times == 0) {
      fetchContacts();
      times++;
    }
  }

  @override
  Widget build(BuildContext context) {
    chatList = Provider.of<Data>(context, listen: true).getChatList;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //   // Row(
            //   //   mainAxisAlignment: MainAxisAlignment.start,
            //   //   children: const [
            const Text(
              'Chats',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // //   ],
            // // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Hero(
                tag: "search bar",
                child: Material(
                  child: SearchBar(
                    autoFocus: false,
                    showIcon: false,
                    onChanged: (value) {},
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SearchScreen();
                        },
                      ));
                    },
                    onIconPressed: () {},
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatList.length,
              shrinkWrap: true,
              // physics: const BouncingScrollPhysics(
              //   parent: AlwaysScrollableScrollPhysics(),
              // ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) {
                return ChatTile(
                  name: chatList[index].name,
                  username: chatList[index].username,
                  secondaryText: chatList[index].secondaryText,
                  image: chatList[index].image,
                  time: chatList[index].time,
                  isRead: chatList[index].isRead,
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
