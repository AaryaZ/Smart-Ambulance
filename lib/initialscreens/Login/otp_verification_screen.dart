import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/Home/navbar.dart';
import 'package:pinput/pinput.dart';
import 'package:smartambulance/themes/theme.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber; // Required parameter

  OtpVerificationScreen({required this.phoneNumber});
  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  // Constructor
  @override
  Widget build(BuildContext context) {
    double getResponsiveFontSize(double baseSize) {
      return MediaQuery.of(context).size.width / 375 * baseSize;
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String? otpCode;
    int otplength = 0;

    String lastFiveDigits = widget.phoneNumber.length >= 5
        ? widget.phoneNumber.substring(widget.phoneNumber.length - 5)
        : widget.phoneNumber;

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
                      style: GoogleFonts.inter(
                        color: Color(0xFF3A3A3A),

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
                  'Log in using the OTP sent to +${'x' * (widget.phoneNumber.length - 5)}$lastFiveDigits',
                  style: GoogleFonts.inter(
                    color: Color(0xFF3A3A3A),

                    fontSize: getResponsiveFontSize(24), // Fixed font size
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.41,
                    height: 1.1,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.11),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Pinput(
                  length: 4,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: LTheme.primaryGreen),
                    ),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  onChanged: (value) {
                    setState(() {
                      otpCode = value;
                    });
                  },
                ),
              ),

              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
              //   child: TextField(
              //     keyboardType: TextInputType.number,
              //     decoration: InputDecoration(
              //       contentPadding:
              //           EdgeInsets.symmetric(vertical: screenHeight * 0.012),
              //       labelText: '',
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(5.0),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(5.0),
              //         borderSide: BorderSide(color: Colors.teal),
              //       ),
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              SizedBox(height: screenHeight * 0.01),

              // Row for Resend OTP and Change Number
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Add your resend OTP functionality here
                      },
                      child: Text(
                        'Resend OTP',
                        style: GoogleFonts.inter(
                          color: Color(0xFF3BA6F3),

                          fontSize:
                              getResponsiveFontSize(14), // Fixed font size
                          letterSpacing: -0.41,
                          decoration: TextDecoration.none,
                        ),
                        // textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => LoginScreen()),
                        // );
                      },
                      child: Text(
                        'Change Number',
                        style: GoogleFonts.inter(
                          color: Color(0xFF3BA6F3),

                          fontSize:
                              getResponsiveFontSize(14), // Fixed font size
                          letterSpacing: -0.41,
                          decoration: TextDecoration.none,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNav()),
                        (route) => false);
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
      ),
    );
  }
}
