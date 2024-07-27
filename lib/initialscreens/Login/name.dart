import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/initialscreens/Login/location.dart';

class NameScreen extends StatefulWidget {
  final String phoneNumber; // Add phoneNumber as a required parameter

  NameScreen({required this.phoneNumber}); // Constructor to receive phoneNumber

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordValid = true;
  bool _doPasswordsMatch = true;
  bool _isNextButtonEnabled = false;

  void _validatePassword() {
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    setState(() {
      _isPasswordValid = _isStrongPassword(password);
      _doPasswordsMatch = password == confirmPassword;
      _isNextButtonEnabled = _isPasswordValid && _doPasswordsMatch;
    });
  }

  bool _isStrongPassword(String password) {
    final regex = RegExp(
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');
    return regex.hasMatch(password);
  }

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
              SizedBox(height: screenHeight * 0.05),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: Text(
                      '', // Empty header text
                      style: GoogleFonts.inter(
                        color: Color(0xFF3A3A3A),

                        fontSize: getResponsiveFontSize(25), // Fixed font size
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.41,
                        height: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
                child: Text(
                  'Enter Your Details',
                  style: GoogleFonts.inter(
                    color: Color(0xFF3A3A3A),

                    fontSize: getResponsiveFontSize(25), // Fixed font size
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
                  'Please enter your details to proceed. The information will be used henceforth for communication purposes.',
                  style: GoogleFonts.inter(
                    fontSize: getResponsiveFontSize(16), // Fixed font size
                    color: Colors.grey,
                    letterSpacing: -0.41,
                    height: 1.4,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.07),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
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
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0), // Reduced height
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        onChanged: (_) => _validatePassword(),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          errorText: !_isPasswordValid
                              ? 'Must include a special character , a number and must be 8 characters long'
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0), // Reduced height
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        onChanged: (_) => _validatePassword(),
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          errorText: !_doPasswordsMatch
                              ? 'Passwords do not match'
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0), // Reduced height
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.11),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isNextButtonEnabled
                      ? () {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Location(phoneNumber: widget.phoneNumber),
                              ),
                            );
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isNextButtonEnabled ? Color(0xFF1D7C76) : Colors.grey,
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
