// ignore_for_file: must_be_immutable

import 'package:chat_app/data.dart';
import 'package:chat_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  User? currentUser;

  @override
  Widget build(BuildContext context) {
    currentUser = Provider.of<Data>(context, listen: true).currentUser;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        physics: const NeverScrollableScrollPhysics(),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: CircleAvatar(
                        // ignore: unnecessary_null_comparison
                        backgroundImage: AssetImage(currentUser!.profileImage),
                        radius: 50.0,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentUser!.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 26.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            currentUser!.username,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.email,
                        size: 40.0,
                        color: Color(0xff4e4655),
                      ),
                      Text(
                        currentUser!.email,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff4e4655),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
