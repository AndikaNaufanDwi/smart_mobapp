import 'package:flutter/material.dart';
import 'package:smart_mobapp/fungsi/color_theme.dart';
import 'package:smart_mobapp/fungsi/widgets.dart';
import 'package:smart_mobapp/screen/after_login/home_screen.dart';
import 'package:smart_mobapp/fungsi/reuseable_textfield.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: LightTheme.themeWhite,
            body: ListView(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    signIn('Sign Up'),
                    Center(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/tubi.png'),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                        ),
                        const SizedBox(height: 16),
                        loginText('Username'),
                        ReusableTextField(
                          text: '',
                          isPasswordType: false,
                          controller: usernameController,
                        ),
                        const SizedBox(height: 16),
                        loginText('Email'),
                        ReusableTextField(
                          text: '',
                          isPasswordType: false,
                          controller: passwordController,
                        ),
                        const SizedBox(height: 16),
                        loginText('Password'),
                        ReusableTextField(
                          text: '',
                          isPasswordType: true,
                          controller: confirmPasswordController,
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: GestureDetector(
                            onTapDown: (_) {
                              setState(() {
                                isPressed = true;
                              });
                            },
                            onTapUp: (_) {
                              setState(() {
                                isPressed = false;
                              });
                              //Sign Up Logic ke sini
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: isPressed
                                    ? Colors.white
                                    : LightTheme.primacCyan,
                              ),
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: isPressed
                                        ? LightTheme.primacCyan
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
