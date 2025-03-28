import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'name.dart'; // Import the name.dart file

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneNumber = ''; // Variable to store the phone number

  @override
  Widget build(BuildContext context) {
    double getResponsiveFontSize(double baseSize) {
      return MediaQuery.of(context).size.width / 375 * baseSize;
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.04,
          horizontal: screenWidth * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.04),
              SizedBox(height: screenHeight * 0.1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
                child: Text(
                  'Enter phone number for verification',
                  style: GoogleFonts.inter(
                    color: Color(0xFF3A3A3A),

                    fontSize: getResponsiveFontSize(25), // Fixed font size
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
                  style: GoogleFonts.inter(
                    fontSize: getResponsiveFontSize(16), // Fixed font size
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.012),
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
                    setState(() {
                      phoneNumber =
                          phone.completeNumber; // Update the phone number
                    });
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.18),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (phoneNumber.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NameScreen(phoneNumber: phoneNumber),
                        ),
                      );
                    } else {
                      // Show an error message or handle empty phone number
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter a phone number')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1D7C76),
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.016),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'NEXT',
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
      ),
    );
  }
}
