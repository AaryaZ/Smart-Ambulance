import 'package:flutter/material.dart';
import 'login.dart'; // Ensure this import is correct

class NameScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.04,
          horizontal: screenWidth * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.1),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
              child: Text(
                'Enter Your Name',
                style: TextStyle(
                  color: Color(0xFF3A3A3A),
                  fontFamily: 'Roboto',
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.41,
                  height: 1.1,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.009),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
              child: Text(
                'Please enter your name to proceed, This information will be used henceforth for communication purposes.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: isLandscape ? screenWidth * 0.014 : screenWidth * 0.038,
                  color: Colors.grey,
                  letterSpacing: -0.41,
                  height: 1.4,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.111),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Reduced height
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.21),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to LoginScreen and pass the name if needed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()), // Assuming LoginScreen is in login.dart
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1D7C76),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.016),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenWidth * 0.037,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
