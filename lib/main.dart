import 'package:flutter/material.dart';
import 'package:smartambulance/initialscreens/Ambulance/ambulance.dart';
import 'package:smartambulance/initialscreens/Booking/nearestambulance.dart';
import 'package:smartambulance/initialscreens/Home/home.dart';
import 'package:smartambulance/initialscreens/Home/navbar.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Ambulance',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
