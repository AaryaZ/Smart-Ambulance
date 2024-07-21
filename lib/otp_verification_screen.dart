import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
            SizedBox(height: screenHeight * 0.05),

            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: screenWidth * 0.0),
                Expanded(
                  child: Text(
                    '', // Empty header text
                    style: TextStyle(
                      color: Color(0xFF3A3A3A),
                      fontFamily: 'Roboto',
                      fontSize: 24.0, // Fixed font size
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.41,
                      height: 1.1,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.05),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
              child: Text(
                'Log in using the OTP sent to +xxxxxxxxxx',
                style: TextStyle(
                  color: Color(0xFF3A3A3A),
                  fontFamily: 'Roboto',
                  fontSize: 24.0, // Fixed font size
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.41,
                  height: 1.1,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.11),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.012),
                  labelText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),

            Center(
              child: GestureDetector(
                onTap: () {
                  // Add your resend OTP functionality here
                },
                child: Text(
                  'Resend OTP',
                  style: TextStyle(
                    color: Color(0xFF3BA6F3),
                    fontFamily: 'Roboto',
                    fontSize: 15.0, // Fixed font size
                    letterSpacing: -0.41,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.18),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add your OTP submission functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1D7C76),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.016),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'VERIFY',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.0, // Fixed font size
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
