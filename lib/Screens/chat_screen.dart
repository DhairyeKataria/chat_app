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
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

// Future fetchContacts() async {
//   final response = await http.get(Uri.parse('$url/contacts/$currentUser'));
//   // List<Chat> _chatList = [];
//   // for (int i = 0; i < jsonDecode(response.body).length; i++) {
//   //   if (Chat.fromJson(jsonDecode(response.body)[i]).name != null) {
//   //     _chatList.add(Chat.fromJson(jsonDecode(response.body)[i]));
//   //   }
//   //   // print(jsonDecode(response.body[i]));
//   // }
//   print(jsonDecode(response.body)[0]);
//   return;
// }

class _ChatScreenState extends State<ChatScreen> {
  // final List<Chat> chatList = Data.chatList;
  List<Chat> chatList = [];

  // Future Function()? fetchContacts;

  Future fetchContacts() async {
    final response = await http.get(Uri.parse('$url/contacts/$currentUser'));
    List<Chat> _chatList = [];
    for (int i = 0; i < jsonDecode(response.body).length; i++) {
      Chat chat = Chat.fromJson(jsonDecode(response.body)[i]);
      if (chat.name != null) {
        _chatList.add(chat);
        // Provider.of<Data>(context, listen: false).addChat(chat);
      }
      // print(jsonDecode(response.body[i]));
    }
    Provider.of<Data>(context, listen: false).setChatList(_chatList);
    // chatList = Provider.of<Data>(context, listen: true).getChatList;
    // setState(() {

    // });
    // setState(() {
    //   // chatList.add(Chat.fromJson(jsonDecode(response.body)[0]));
    //   chatList = _chatList;
    // // chatList = Provider.of<Data>(context, listen: true).getChatList;
    // });
    // Chat chat = Chat.fromJson(jsonDecode(response.body)[0]);
    print(jsonDecode(response.body));
    // print(chat.name);
    return;
  }
  // void fetchContacts() async {
  //   final response = await http.get(Uri.parse('$url/contacts/$currentUser'));
  //   List<Chat> _chatList = [];
  //   for (int i = 0; i < response.body.length; i++) {
  //     _chatList.add(Chat.fromJson(jsonDecode(response.body[i])));
  //   }
  //   print(jsonDecode(response.body));
  //   setState(() {
  //     chatList = _chatList;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<Data>(context, listen: false).fetchContacts();
    // chatList = await fetchContacts();

    // Future fetchContacts() async {
    //   final response = await http.get(Uri.parse('$url/contacts/$currentUser'));
    //   List<Chat> _chatList = [];
    //   for (int i = 0; i < jsonDecode(response.body).length; i++) {
    //     Chat chat = Chat.fromJson(jsonDecode(response.body)[i]);
    //     if (chat.name != null) {
    //       _chatList.add(chat);
    //       // Provider.of<Data>(context, listen: false).addChat(chat);
    //     }
    //     // print(jsonDecode(response.body[i]));
    //   }
    //   Provider.of<Data>(context, listen: false).setChatList(_chatList);
    //   // setState(() {
    //   //   // chatList.add(Chat.fromJson(jsonDecode(response.body)[0]));
    //   //   chatList = _chatList;
    //   // });
    //   // Chat chat = Chat.fromJson(jsonDecode(response.body)[0]);
    //   print(jsonDecode(response.body));
    //   // print(chat.name);
    //   return;
    // }

    // setState(() {
    //   fetchContacts();
    // });

    chatList = Provider.of<Data>(context, listen: true).getChatList;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: const [
            const Text(
              'Chats',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            //   ],
            // ),
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
                          return const SearchScreen();
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
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemBuilder: ((context, index) {
                return ChatTile(
                  text: chatList[index].name,
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
