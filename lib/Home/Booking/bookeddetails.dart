import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartambulance/Home/home.dart';
import 'package:smartambulance/themes/theme.dart';

class Bookeddetails extends StatefulWidget {
  const Bookeddetails({super.key});

  @override
  State<Bookeddetails> createState() => _BookeddetailsState();
}

Future<void> saveCurrentBookingData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('booking_confirmed', true);
}

class _BookeddetailsState extends State<Bookeddetails> {
  @override
  void initState() {
    super.initState();
    saveCurrentBookingData();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double getResponsiveFontSize(double baseSize) {
      return MediaQuery.of(context).size.width / 375 * baseSize;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment(-1, -0.8),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: LTheme.primaryGreen,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: screenWidth * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      color: LTheme.primaryGreen,
                      size: 100,
                    ),
                    Text(
                      "REQUEST ACCEPTED\n SUCCESSFULLY",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          color: LTheme.primaryGreen,
                          fontSize: getResponsiveFontSize(20),
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text("Booking Details",
                  style: GoogleFonts.inter(
                      fontSize: getResponsiveFontSize(20),
                      fontWeight: FontWeight.w600,
                      color: Colors.grey)),
              SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Confirmation Status",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Text("Confirmed",
                          style: TextStyle(
                              color: LTheme.primaryGreen,
                              fontSize: getResponsiveFontSize(16)))
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date And Time",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Text("20-07-2024 9:30:00",
                          style: TextStyle(
                              color: LTheme.primaryGreen,
                              fontSize: getResponsiveFontSize(16)))
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Type",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Text("ECO",
                          style: TextStyle(
                              color: LTheme.primaryGreen,
                              fontSize: getResponsiveFontSize(16)))
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pickup At",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          "Mira Road",
                          style: TextStyle(
                              color: LTheme.primaryGreen,
                              fontSize: getResponsiveFontSize(16)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          // textDirection: TextDirection.rtl,
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Drop At",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          "St. Vincent Mira Road Lokhandwala",
                          style: TextStyle(
                              color: LTheme.primaryGreen,
                              fontSize: getResponsiveFontSize(16)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          // textDirection: TextDirection.rtl,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Other Charges",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Text("Rs. 0.00",
                          style: TextStyle(
                              color: LTheme.primaryGreen,
                              fontSize: getResponsiveFontSize(16)))
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Accident Insurance",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Text("Rs. 0.00",
                          style: TextStyle(
                              color: LTheme.primaryGreen,
                              fontSize: getResponsiveFontSize(16)))
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Text("Rs. 1897.57",
                          style: TextStyle(
                              color: LTheme.primaryGreen,
                              fontSize: getResponsiveFontSize(16)))
                    ],
                  ),
                  SizedBox(height: 8.0),
                ],
              ),
              SizedBox(height: 20),
              Align(
                  alignment: Alignment(0, 0.9),
                  child: Text(
                    "Redirecting to home page in 5s",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: getResponsiveFontSize(12)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
