import 'package:flutter/material.dart';
import '../components/chat_bubble.dart';
import '../components/chat_detail_appbar.dart';
import '../data.dart';
import '../models/chat_message.dart';
import '../models/chat_model.dart';
import '../models/send_menu_items.dart';

// ignore: use_key_in_widget_constructors
class ChatDetail extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ChatDetail(this.chat);

  final Chat chat;

  @override
  _ChatDetailState createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  final List<ChatMessage> chatMessage = Data.chatMessage;

  List<SendMenuItems> menuItems = [
    SendMenuItems(
        text: "Photos & Videos", icons: Icons.image, color: Colors.amber),
    SendMenuItems(
        text: "Document", icons: Icons.insert_drive_file, color: Colors.blue),
    SendMenuItems(text: "Audio", icons: Icons.music_note, color: Colors.orange),
    SendMenuItems(
        text: "Location", icons: Icons.location_on, color: Colors.green),
    SendMenuItems(text: "Contact", icons: Icons.person, color: Colors.purple),
  ];

  void showModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              color: const Color(0xff737373),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: Container(
                          height: 4,
                          width: 50,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        itemCount: menuItems.length,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: menuItems[index].color.shade50,
                                ),
                                height: 50,
                                width: 50,
                                child: Icon(
                                  menuItems[index].icons,
                                  size: 20,
                                  color: menuItems[index].color.shade400,
                                ),
                              ),
                              title: Text(menuItems[index].text),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatDetailPageAppBar(widget.chat),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: chatMessage.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ChatBubble(
                chatMessage: chatMessage[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 16, bottom: 10),
              height: 80,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showModal();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 21,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 62.0),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: "Type message...",
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.only(right: 30, bottom: 50),
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                backgroundColor: Colors.pink,
                elevation: 1.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
