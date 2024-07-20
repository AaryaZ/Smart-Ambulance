import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'otp_verification_screen.dart'; // Add this import

class LoginScreen extends StatelessWidget {
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
                'Enter Phone number for verification',
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
            SizedBox(height: screenHeight * 0.015),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
              child: Text(
                'This number will be used for all kinds of communications. You shall receive an SMS with code for verifications.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: isLandscape ? screenWidth * 0.014 : screenWidth * 0.038,
                  color: Colors.grey,
                  letterSpacing: -0.41,
                  height: 1.4,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.1),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
              child: IntlPhoneField(
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
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.11),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OtpVerificationScreen()),
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
