import 'package:flutter/material.dart';
import '/constants.dart';

// Use this widget when you need a text input field
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.hintText, // Placeholder that appears when the text field is empty
    this.onChanged, // Function called when user types (takes updated text as a parameter)
    this.controller, // Controller to manage the text in the text field
    this.obscureText = false, // Set to true for password field
    this.validator, // Function used for validating the input
  });

  final Function(String)? onChanged; // Function that gets triggered when the user inputs text
  final String? hintText; // Display a placeholder text
  final TextEditingController? controller; // Controller to manage text input
  final bool obscureText; // Hide text for password fields
  final String? Function(String?)? validator; // Validator function for form validation

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: kPrimaryColor,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
      ),
      validator: validator, 
    );
  }
}
