import 'package:flutter/material.dart';
import '../components/chat_tile.dart';
import '../components/search_bar.dart';
import '../models/chat_model.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  final List<Chat> chatList = [
    Chat(
      text: 'Jane Russel',
      secondaryText: 'Awesome Setup',
      image: 'images/userImage1.jpeg',
      time: 'Now',
      isRead: false,
    ),
    Chat(
      text: 'Glad\'s Murphy',
      secondaryText: 'That\'s Great!!',
      image: 'images/userImage2.jpeg',
      time: 'yesterday',
      isRead: true,
    ),
    Chat(
      text: 'Jorge Henry',
      secondaryText: 'Hey, Where are you ??',
      image: 'images/userImage3.jpeg',
      time: '5 Apr',
      isRead: true,
    ),
    Chat(
      text: 'Philip Fox',
      secondaryText: 'Busy!! Call me in 10',
      image: 'images/userImage4.jpeg',
      time: '1 Apr',
      isRead: true,
    ),
    Chat(
      text: 'Debra Hawkings',
      secondaryText: 'Thank you, It\'s awesome',
      image: 'images/userImage5.jpeg',
      time: ' 1 Apr',
      isRead: true,
    ),
    Chat(
      text: 'Jacob Pena',
      secondaryText: 'will update you in the evening',
      image: 'images/userImage6.jpeg',
      time: '31 March',
      isRead: false,
    ),
    Chat(
      text: 'Andrey Jones',
      secondaryText: 'Can you please share the file',
      image: 'images/userImage7.jpeg',
      time: '20 March',
      isRead: true,
    ),
    Chat(
      text: 'John Wicks',
      secondaryText: 'How are you ??',
      image: 'images/userImage8.jpeg',
      time: '28 Feb',
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Chats',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchBar(
                onChanged: (value) {},
                onPressed: () {},
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
