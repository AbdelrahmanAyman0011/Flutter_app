import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication
import '/widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '/constant.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  String id = 'registerPage'; // identifier for the page hst3mlo f l navigation wna bro7 mn page l el tnya
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    // Controllers for the input fields
    final TextEditingController emailController = TextEditingController(); // da ykhleny akhod l input ely l user d5lo (retrieve) w abd2 ast3mlo b3d kda a3mlo manage 
    final TextEditingController passwordController = TextEditingController();

    // Form key for validation, b33ml link ben l form w global key ykhleny a3rf ast3mlha b3d keda f ay goz2 mn l code to validate its inputs msln
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 

    // Register function
    Future<void> registerUser() async {
      if (_formKey.currentState?.validate() ?? false) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
          print("Registration Successful");
          // Optionally, navigate to login page or home page after registration
          Navigator.pushReplacementNamed(context, '/login'); // Navigate to login after registration
        } catch (e) {
          print("Registration Failed: $e");
          // Optionally, display an error message or Snackbar
        }
      }
    }

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: _formKey, // Attach the form key
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Image(
                image: AssetImage('images/logo.png'),
                width: 200,
                height: 200,
              ),
              const Row(
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24,
                      color: kTextPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'Email',
                controller: emailController, // links this TextField to the controller, el controllers el fo2 are passed to the TextField widgets through the controller property, making it easier to manage the input values when the user presses the Register button.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'Password',
                controller: passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                text: 'Register',
                onTap: registerUser, // Trigger the register function
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? ',
                      style: TextStyle(color: kTextPrimary)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login'); // Use route for login
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: kTextPrimary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}  