import 'package:flutter/material.dart';
import 'login.dart'; // Import the LoginScreen widget from login.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // Set the LoginScreen as the home page
    );
  }
}
