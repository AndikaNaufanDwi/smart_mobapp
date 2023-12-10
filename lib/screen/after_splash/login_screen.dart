import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_mobapp/fungsi/color_theme.dart';
import 'package:smart_mobapp/screen/after_login/home_screen.dart';
import 'package:smart_mobapp/fungsi/reuseable_textfield.dart';
import 'package:smart_mobapp/screen/after_splash/sign_up.dart';
import 'package:smart_mobapp/fungsi/widgets.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
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
                  Center(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset('assets/tubi.png'),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                      ),
                      signIn('Sign In'),
                      const SizedBox(height: 16),
                      loginText('Username'),
                      ReusableTextField(
                          text: '',
                          isPasswordType: false,
                          controller: usernameController),
                      const SizedBox(height: 16),
                      loginText('Password'),
                      ReusableTextField(
                          text: '',
                          isPasswordType: true,
                          controller: passwordController),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(text: 'Belum Punya Akun? '),
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: LightTheme.primacCyan,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()),
                                  );
                                },
                              // recognizer: TapGestureRecognizer()..onTap = () => signUpFunction(), (Damn ternyata screen sign up belum dibuat)
                            ),
                          ],
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 16),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
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
                                'Sign In',
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
      }),
    );
  }
}
