import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/Home/Booking/bookingdetails.dart';
import 'package:smartambulance/Home/home.dart';
import 'package:smartambulance/themes/theme.dart';

class NearestAmbulance extends StatefulWidget {
  const NearestAmbulance({super.key});

  @override
  State<NearestAmbulance> createState() => _NearestAmbulanceState();
}

class _NearestAmbulanceState extends State<NearestAmbulance> {
  double getResponsiveFontSize(double baseSize) {
    return MediaQuery.of(context).size.width / 375 * baseSize;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 25, right: 18),
      child: Container(
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
              SizedBox(
                height: 30,
              ),
              Text(
                "Hold on Connecting with the\nNearest Ambulance",
                style: TextStyle(
                    color: LTheme.primaryGreen,
                    fontSize: getResponsiveFontSize(22),
                    fontWeight: FontWeight.w500),
              ),
              Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.circle,
                        color: LTheme.primaryGreen,
                      ),
                      _buildInfoField({
                        "Pickup From":
                            "Anton Colony, GT Road, Near MKS office,Nerul"
                      }, context),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.red[200],
                      ),
                      _buildInfoField({
                        "Drop At": "St. Vincent’s Hospital, A.J Road, Kurla"
                      }, context),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: getResponsiveFontSize(16)),
                          ),
                          Text("Mira Road",
                              style: TextStyle(
                                  color: LTheme.primaryGreen,
                                  fontSize: getResponsiveFontSize(16)))
                        ],
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Booking()));
                          },
                          child: Container(
                            height: 60,
                            width: screenWidth * 0.9,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: LTheme.primaryGreen,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              "ACCEPT",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: getResponsiveFontSize(17),
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showConfirmationDialog(context);
                        },
                        child: Container(
                          height: 60,
                          width: screenWidth * 0.9,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: LTheme.secondaryGreen,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.inter(
                              color: LTheme.primaryGreen,
                              fontSize: getResponsiveFontSize(17),
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

Widget _buildInfoField(Map<String, String> info, BuildContext context) {
  var GlobalWidth = MediaQuery.of(context).size.width;
  var GlobalHeight = MediaQuery.of(context).size.height;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        info.keys.first,
        style: GoogleFonts.inter(
          fontSize: 14.0,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 5.0),
      Container(
        width: GlobalWidth * 0.75,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  info.values.first,
                  style: GoogleFonts.inter(fontSize: 16.0),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

//----custom dialog---

void _showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: LTheme.bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'CONFIRMATION',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: LTheme.primaryGreen),
              ),
              SizedBox(height: 20.0),
              Text(
                'Are you sure you want to cancel the ride?',
                style: TextStyle(fontSize: 18.0, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: LTheme.primaryGreen,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          "NO",
                          style: GoogleFonts.inter(
                            color: LTheme.primaryGreen,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        _showCancellationDialog(context);
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: LTheme.primaryGreen,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          "Yes",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _showCancellationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: LTheme.bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'BOOKING',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: LTheme.primaryGreen),
              ),
              SizedBox(height: 20.0),
              Text(
                'Your Ambulance Booking Cancelled Successfully.',
                style: TextStyle(fontSize: 18.0, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                            (route) => false);
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: LTheme.primaryGreen,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          "Okay",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
