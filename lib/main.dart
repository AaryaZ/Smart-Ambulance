import 'package:flutter/material.dart';
import 'name.dart'; // Import the NameScreen widget from name.dart

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
      home: NameScreen(), // Set the NameScreen as the home page
    );
  }
}
