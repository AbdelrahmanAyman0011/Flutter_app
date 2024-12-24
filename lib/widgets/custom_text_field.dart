import 'package:flutter/material.dart';
import '/constant.dart';
// Use this widget when you need a text input field (wna 3yza l user ydkhl input)
class CustomTextField extends StatelessWidget {
  CustomTextField({  // constructor
    super.key,
    this.hintText, // placeholder that appears when the text field is empty.
    this.onChanged, // function yt3mlha call lma ad5l text (take l upated text ka parameter) 
    // When you create a TextField, you pass the TextEditingController to it using the controller property
    this.controller, // manage the text in the text field, allowing you to retrieve or modify it
    this.obscureText = false, // hst3mlha 3shan a3ml hide l el pass
    this.validator, // function used for validating the input btrg3 error lw fail
  });

  final Function(String)? onChanged; // function that gets triggered kol ma l user yd5l input 
  final String? hintText; //  display a placeholder text (enter ur name)
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator; // function hst3mlha 3shan a check 3la byanat l user valid or not
  @override
  Widget build(BuildContext context) {
    return TextFormField( // l form ely l user hyd5l feha l data bt3to
      onChanged: onChanged, // call l el function
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: kTextPrimary,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kTextPrimary,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kTextPrimary,
          ),
        ),
      ),
      validator: validator, // Add validator here
    );
  }
} 