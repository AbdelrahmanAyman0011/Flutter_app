import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';  // Import Firebase core
import 'screens/login_page.dart';  // Import login page
import 'screens/Register_page.dart';  // Import register page

void main() async {
  // Ensure Flutter bindings are initialized before Firebase is used
  WidgetsFlutterBinding.ensureInitialized(); //  ensure that all the switches, controls, and sensors are powered up and ready. ensures Flutter has set up everything required for Firebase.
  // Initialize Firebase
  await Firebase.initializeApp(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',  // Defines the first screen displayed when the app launches.
      routes: { // t5ly l navigation between screens easier and more organized.
        '/login': (context) => LoginPage(),    // Login page route, /login --> route name
        '/register': (context) => RegisterPage(), // Register page route
      },
    );
  }
}

