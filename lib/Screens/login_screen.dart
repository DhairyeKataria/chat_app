import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/user.dart';

Future<User> logInUser(String username, String password) async {
  final dynamic response;
  final User user;
  final String url;
  if (Platform.isAndroid) {
    url = 'http://10.0.2.2:8000/login';
  } else {
    url = 'http://localhost:8000/login';
  }
  try {
    response = await http.post(
      Uri.parse(url),
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
    return user;
  } else {
    dynamic decodedData = jsonDecode(response.body);
    throw Exception(decodedData["error"]);
  }
}

class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String? username;
  String? password;
  bool _showSpinner = false;
  User? _loginUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Hey,',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Login Now.',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    physics: keyboardDependentScrollPhysics(context),
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 2 / 5,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.pink,
                            cursorRadius: const Radius.circular(20.0),
                            cursorWidth: 10.0,
                            cursorHeight: 22.0,
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Enter the username',
                            ),
                            onChanged: (value) {
                              if (value == '') {
                                username = null;
                              } else {
                                username = value;
                              }
                            },
                          ),
                          TextField(
                            obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.pink,
                            cursorRadius: const Radius.circular(20.0),
                            cursorWidth: 10.0,
                            cursorHeight: 22.0,
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Enter the password',
                            ),
                            onChanged: (value) {
                              if (value == '') {
                                password = null;
                              } else {
                                password = value;
                              }
                            },
                          ),
                          TextButton(
                            onPressed: () async {
                              if (username == null || password == null) {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.ERROR,
                                  animType: AnimType.SCALE,
                                  title: 'Empty Field(s)',
                                  desc: 'Empty Username or Password',
                                  btnOkOnPress: () {},
                                ).show();
                                return;
                              }

                              setState(() {
                                _showSpinner = true;
                              });

                              try {
                                _loginUser =
                                    await logInUser(username!, password!);
                                if (_loginUser != null) {
                                  Navigator.pushNamed(context, 'main');
                                }
                              } catch (e) {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.ERROR,
                                  animType: AnimType.SCALE,
                                  title: e.toString().substring(11),
                                  btnOkOnPress: () {},
                                ).show();
                              }

                              setState(() {
                                _showSpinner = false;
                              });
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
                                'Log In',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Not a user yet?',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'SignUp');
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
