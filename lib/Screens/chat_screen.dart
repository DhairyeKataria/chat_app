import 'package:chat_app/Screens/search_screen.dart';
import 'package:chat_app/data.dart';
import 'package:flutter/material.dart';
import '../components/chat_tile.dart';
import '../components/search_bar.dart';
import '../models/chat_model.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  final List<Chat> chatList = Data.chatList;

  @override
  Widget build(BuildContext context) {
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
              itemCount: 8,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemBuilder: ((context, index) {
                return ChatTile(
                  text: chatList[index].text,
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
