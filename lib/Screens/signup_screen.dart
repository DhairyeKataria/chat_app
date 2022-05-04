import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/components/profile_image_uploader_sheet.dart';

Future<User> createUser(
    String name, String username, String email, String password) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:7000/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    }),
  );
  if (response.statusCode == 201) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error creating user');
  }
}

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  Future<User>? _user;

  late String name;
  late String username;
  late String email;
  late String password;

  List<String> signUpFields = [
    'Enter your name',
    'Enter you username',
    'Enter your email',
    'Enter you password'
  ];

  @override
  Widget build(BuildContext context) {
    //
    List<Function(String)> signUpFunctions = [
      (value) {
        name = value;
      },
      (value) {
        username = value;
      },
      (value) {
        email = value;
      },
      (value) {
        password = value;
      },
    ];

    void takePhoto(ImageSource source) async {
      final pickedFile = await _picker.pickImage(source: source);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height / 1.2,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(
                            radius: 80.0,
                            backgroundImage: AssetImage("images/default.png"),
                          ),
                          Positioned(
                            bottom: 0,
                            right: -24,
                            child: RawMaterialButton(
                              padding: const EdgeInsets.all(12.0),
                              fillColor: const Color(0xFFF5F6F9),
                              shape: const CircleBorder(),
                              elevation: 3.0,
                              child: Icon(
                                FontAwesomeIcons.pen,
                                color: Colors.pink.shade300,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>
                                      profileImageUploaderSheet(context),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Container(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height * 2 / 5,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < 4; i++)
                              TextField(
                                keyboardType: TextInputType.name,
                                cursorColor: Colors.pink,
                                cursorRadius: const Radius.circular(20.0),
                                cursorWidth: 10.0,
                                cursorHeight: 22.0,
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: signUpFields[i],
                                ),
                                onChanged: signUpFunctions[i],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (MediaQuery.of(context).viewInsets.bottom == 0)
                    TextButton(
                      onPressed: () async {
                        //TODO: Implement SignUp Functionality here
                        _user = createUser(name, username, email, password);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green.shade100,
                        ),
                        foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.green,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
