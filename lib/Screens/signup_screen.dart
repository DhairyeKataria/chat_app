import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  late String username;
  late String email;
  late String password;
  late String secondPassword;

  @override
  Widget build(BuildContext context) {
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
                  const Expanded(
                    flex: 2,
                    child: Center(
                      child: CircleAvatar(
                        radius: 80.0,
                        backgroundImage: AssetImage('images/userImage1.jpeg'),
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
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextField(
                                keyboardType: TextInputType.name,
                                cursorColor: Colors.pink,
                                cursorRadius: const Radius.circular(20.0),
                                cursorWidth: 10.0,
                                cursorHeight: 22.0,
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter your username',
                                ),
                                onChanged: (value) {
                                  username = value;
                                },
                              ),
                              TextField(
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.pink,
                                cursorRadius: const Radius.circular(20.0),
                                cursorWidth: 10.0,
                                cursorHeight: 22.0,
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter your email',
                                ),
                                onChanged: (value) {
                                  email = value;
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
                                  password = value;
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
                                  hintText: 'Re-Enter the password',
                                ),
                                onChanged: (value) {
                                  secondPassword = value;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (MediaQuery.of(context).viewInsets.bottom == 0)
                    TextButton(
                      onPressed: () {
                        //TODO: Implement SignUp Functionality here
                        print(username);
                        print(email);
                        print(password);
                        print(secondPassword);
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
