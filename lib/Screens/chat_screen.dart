// ignore_for_file: unnecessary_null_comparison

import 'package:chat_app/models/user.dart';
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

  Future justSignedUpUser(String username, String password) async {
    final dynamic response;
    final User user;
    try {
      response = await http.post(
        Uri.parse('$url/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username.toLowerCase(),
          'password': password,
        }),
      );
    } catch (e) {
      throw Exception('Error connecting to the database');
    }

    user = User.fromJson(jsonDecode(response.body));
    if (user.name != null) {
      print(response.body);
      Provider.of<Data>(context, listen: false).setCurrentUser(user);
      return;
    } else {
      dynamic decodedData = jsonDecode(response.body);
      throw Exception(decodedData["error"]);
    }
  }

  Future fetchContacts() async {
    // //
    List<Chat> _chatList = [];
    int length = 0;
    final currentUser =
        Provider.of<Data>(context, listen: false).currentUser.username;

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
  void initState() {
    super.initState();
    if (times == 0) {
      fetchContactsOnInit();
      times++;
    }
  }

  void fetchContactsOnInit() async {
    // if(Provider.of<Data>(context).justSignedUp == true) {
    // final currentUser =
    //     Provider.of<Data>(context, listen: false).currentUser;
    //   justSignedUpUser(currentUser.username, currentUser.)
    // }
    await fetchContacts();
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
                      )).then((value) => fetchContacts());
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
                  secondaryText: chatList[index].latestMessage,
                  image: chatList[index].image,
                  time: chatList[index].time,
                  isRead: chatList[index].isRead,
                  isProfileImageSet: chatList[index].isProfileImageSet,
                  afterPop: () {
                    fetchContacts();
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
