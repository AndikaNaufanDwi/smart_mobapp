import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_mobapp/fungsi/color_theme.dart';
import 'package:smart_mobapp/main.dart';
import 'package:smart_mobapp/screen/after_login/home_screen.dart';
import 'package:smart_mobapp/fungsi/reuseable_textfield.dart';
import 'package:smart_mobapp/screen/after_login/login_info.dart';
import 'package:smart_mobapp/screen/after_splash/sign_up.dart';
import 'package:smart_mobapp/fungsi/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLogin = false;
  final TextEditingController emailController = TextEditingController();
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
                      loginText('Email'),
                      ReusableTextField(
                          text: '',
                          isPasswordType: false,
                          controller: emailController),
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
                            const TextSpan(text: 'Belum Punya Akun? '),
                            TextSpan(
                              text: 'Sign Up',
                              style: const TextStyle(
                                color: LightTheme.primacCyan,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp()),
                                  );
                                },
                            ),
                          ],
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: GestureDetector(
                          onTapDown: (_) {
                            setState(() {
                              isPressed = true;
                            });
                          },
                          onTapUp: (_) async {
                            setState(() {
                              isPressed = false;
                            });
                            signInWithEmailAndPassword();
                            if (isLogin) {
                              List<Pengguna> pengguna =
                                  await InfoQuery.infoQuery(
                                      emailController.text);
                              if (!context.mounted) return;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(
                                          userEmail: emailController.text,
                                          pengguna: pengguna,
                                        )),
                              );
                            }
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

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      isLogin = true;
      // print(isLogin);
    } on FirebaseAuthException catch (e) {
      setState(() {
        var errorMessage = e.message;
        logger.i(errorMessage);
      });
      isLogin = false;
      // print(isLogin);
    }
  }
}

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
