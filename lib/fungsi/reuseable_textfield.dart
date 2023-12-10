import 'package:flutter/material.dart';
import 'package:smart_mobapp/fungsi/color_theme.dart';

class ReusableTextField extends StatefulWidget {
  final String text;
  final bool isPasswordType;
  final TextEditingController controller;

  const ReusableTextField({
    Key? key,
    required this.text,
    required this.isPasswordType,
    required this.controller,
  }) : super(key: key);

  @override
  _ReusableTextFieldState createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: TextField(
        controller: widget.controller,
        obscureText: obscureText,
        enableSuggestions: !widget.isPasswordType,
        autocorrect: !widget.isPasswordType,
        cursorColor: LightTheme.primacCyan,
        style: TextStyle(color: LightTheme.primacCyan),
        decoration: InputDecoration(
          labelText: widget.text,
          labelStyle: TextStyle(color: LightTheme.primacCyan),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: LightTheme.themeWhite,
          contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: LightTheme.primacCyan,
              width: 2,
            ),
          ),
          suffixIcon: widget.isPasswordType
              ? Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: LightTheme.primacCyan,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                )
              : null,
        ),
        keyboardType: widget.isPasswordType
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
      ),
    );
  }
}
