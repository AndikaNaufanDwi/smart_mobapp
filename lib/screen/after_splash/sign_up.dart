import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_mobapp/fungsi/color_theme.dart';
import 'package:smart_mobapp/fungsi/widgets.dart';
import 'package:smart_mobapp/fungsi/reuseable_textfield.dart';
import 'package:smart_mobapp/screen/after_splash/login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Auth
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Firestore
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postalController = TextEditingController();

  bool isPressed = false;

  Future<void> signUp() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } catch (e) {
      print('Error during registration: $e');
    }
  }

  Future<void> writeInfo() async {
    try {
      CollectionReference pengguna =
          FirebaseFirestore.instance.collection('pengguna');

      String documentID = emailController.text.trim();

      await pengguna.doc(documentID).set({
        'username': usernameController.text.trim(),
        'nama_depan': firstNameController.text.trim(),
        'nama_belakang': lastNameController.text.trim(),
        'nama_lengkap':
            '${firstNameController.text.trim()} ${lastNameController.text.trim()}',
        'alamat': {
          'kota': addressController.text.trim(),
          'kode_pos': int.parse(postalController.text.trim()),
        },
      });
    } catch (e) {
      print(e);
    }
  }

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
                        loginText('Email'),
                        ReusableTextField(
                          text: '',
                          isPasswordType: false,
                          controller: emailController,
                        ),
                        const SizedBox(height: 16),
                        loginText('Password'),
                        ReusableTextField(
                          text: '',
                          isPasswordType: true,
                          controller: passwordController,
                        ),
                        const SizedBox(height: 16),
                        loginText('Confirm Password'),
                        ReusableTextField(
                          text: '',
                          isPasswordType: true,
                          controller: confirmPasswordController,
                        ),
                        const SizedBox(height: 16),
                        loginText('Username'),
                        ReusableTextField(
                          text: '',
                          isPasswordType: false,
                          controller: usernameController,
                        ),
                        const SizedBox(height: 16),
                        loginText('First name'),
                        ReusableTextField(
                          text: '',
                          isPasswordType: false,
                          controller: firstNameController,
                        ),
                        const SizedBox(height: 16),
                        loginText('Last name'),
                        ReusableTextField(
                          text: '',
                          isPasswordType: false,
                          controller: lastNameController,
                        ),
                        const SizedBox(height: 16),
                        loginText('Address'),
                        ReusableTextField(
                          text: '',
                          isPasswordType: false,
                          controller: addressController,
                        ),
                        const SizedBox(height: 16),
                        loginText('Postal Code'),
                        ReusableTextField(
                          text: '',
                          isPasswordType: false,
                          controller: postalController,
                        ),
                        const SizedBox(height: 8),
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
                              if (passwordController.text ==
                                  confirmPasswordController.text) {
                                signUp();
                                writeInfo();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ),
                                );
                              } else {
                                // Next pake popup buat register error
                                print('Password does not match!');
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
