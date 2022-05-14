import 'dart:convert';
import 'package:chat_app/components/search_bar.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../data.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  String? contact_username;

  @override
  Widget build(BuildContext context) {
    Future addContact() async {
      final dynamic response;
      final currentUser = Provider.of<Data>(context, listen: false).currentUser;

      try {
        response = await http.post(
          Uri.parse('$url/addContact'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'username': currentUser.username,
            'contact_username': contact_username!,
          }),
        );
      } catch (e) {
        throw Exception('Error connecting to the database');
      }

      print(response.body);
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(right: 8.0, top: 20.0, bottom: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.arrowLeft),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Hero(
                      tag: "search bar",
                      child: Material(
                        child: SearchBar(
                          autoFocus: true,
                          showIcon: true,
                          onIconPressed: () {
                            if (contact_username != null) {
                              int times = 0;
                              if (times == 0) {
                                addContact();
                              }
                            }
                          },
                          onChanged: (value) {
                            if (value == '') {
                              contact_username = null;
                            } else {
                              contact_username = value;
                            }
                          },
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
