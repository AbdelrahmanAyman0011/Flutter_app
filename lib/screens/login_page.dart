import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // use Firebase Authentication methods to log in the user. (simplifies handling user accounts)
import '/widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '/constant.dart';

class LoginPage extends StatelessWidget { // It's only responsible for displaying UI
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) { 
    // Controllers for the input fields
    final TextEditingController emailController = TextEditingController(); // built in f flutter to manage input ykhleny a3rf a2ra w a3dl f l text el dakhl
    final TextEditingController passwordController = TextEditingController(); 

    // formstate dy feha info zy l input valid or not, a3rf a check mn ay mkan f l code hal da valid input or not 
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // GlobalKey<FormState> tkhleny a access l formstate mn ay mkan f l code
    // Login function
    Future<void> loginUser() async { // this function will perform some task that will take time 3shan keda b2ol async
     //to check if all the fields inside the form are valid dy validate 
      if (_formKey.currentState?.validate() ?? false) { // bshof l current state bt3t l form l input el feha 3n tare2 built-in fun l hya validate (t3ml check eno valid email w en l pass >= 6 char)
        try { // ?? lw hya null yrg3 false bdl ma y crash
          await FirebaseAuth.instance.signInWithEmailAndPassword( // await ystna l firebase y check 3 l 7gat l d5lalo
            email: emailController.text.trim(), // bdelo el email w l password bto3 l user yro7 y check 3lehom
            password: passwordController.text.trim(),
          );
          print("Login Successful");  // .trim() remove extra spaces
        } catch (e) {
          print("Login Failed: $e");
        }
      }
    }
    return Scaffold( // basic page layout with an app bar, body, etc.
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: _formKey, // give el form unique identifier ykhleny a3rf at3aml m3 l state bt3t l form
          child: ListView(
            children: [
              const SizedBox(
                height: 75,
              ),
              const Image(
                image: AssetImage('images/logo.png'),
                width: 300,
                height: 300,
              ),
              const Row(
                children: [
                  Text(
                    'Login',
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
                hintText: 'Email',  // validator l kol input lw7do
                controller: emailController,
                validator: (value) { // validator htshof l email lw empty aw wrong format 
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
                text: 'Login',
                onTap: loginUser, // Trigger the login function l m3rfaha fo2
              ),
              const SizedBox(
                height: 15,
              ),
              Row( // a7ot l 2 text gmb b3d l homa dont have an account? register
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account? ', style: TextStyle(color: kTextPrimary)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/register'); // Navigate to RegisterPage using route name
                    },
                    child: const Text(
                      'Register',
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
