import 'package:flutter/material.dart';
import 'package:smartambulance/initialscreens/Login/otp_verification_screen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  final String phoneNumber;
  Location({required this.phoneNumber});
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  TextEditingController locationController = TextEditingController();
  String currentLocation = '';

  Position? userposition;

  @override
  void initState() {
    super.initState();
    _findLocation();
  }

  Future<Position?> _findLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Fluttertoast.showToast(msg: 'Please keep your location On.');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please keep your location On.')),
      );
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      //again denies one more time ask
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Fluttertoast.showToast(msg: 'Location permission denied.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location permission denied.')),
        );
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Fluttertoast.showToast(msg: 'Location permission denied forever.');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location permission denied forever.')),
      );
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        userposition = position;
        currentLocation =
            "${place.locality},${place.postalCode},${place.country}";
        locationController.text = currentLocation;
      });
    } catch (e) {
      print(e);
    }
  }

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: screenHeight * 0.04),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
                child: Text(
                  'Enter Your Location',
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
                    fontFamily: 'Roboto',
                    fontSize: 25.0, // Fixed font size
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
                  "Please share your location with us. This information is crucial for providing accurate and relevant services.",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.0, // Fixed font size
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
                  controller: locationController,
                  decoration: InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0), // Reduced height
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.21),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpVerificationScreen(
                            phoneNumber: widget.phoneNumber),
                      ),
                    );
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
