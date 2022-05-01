import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  late String username;
  late String email;
  late String password;
  late String secondPassword;

  List<String> signUpFields = [
    'Enter your username',
    'Enter you email',
    'Enter your password',
    'Re-Enter you password'
  ];

  @override
  Widget build(BuildContext context) {
    //
    List<Function(String)> signUpFunctions = [
      (value) {
        username = value;
      },
      (value) {
        email = value;
      },
      (value) {
        password = value;
      },
      (value) {
        secondPassword = value;
      },
    ];

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
