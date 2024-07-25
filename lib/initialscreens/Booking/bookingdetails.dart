import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/initialscreens/Booking/paymentoptions.dart';
import 'package:smartambulance/initialscreens/Home/home.dart';
import 'package:smartambulance/themes/theme.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text("Booking Details",
                  style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey)),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Confirmation Status",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text("Confirmed",
                          style: TextStyle(
                              color: LTheme.primaryGreen, fontSize: 16))
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date And Time",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text("20-07-2024 9:30:00",
                          style: TextStyle(
                              color: LTheme.primaryGreen, fontSize: 16))
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Type",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text("ECO",
                          style: TextStyle(
                              color: LTheme.primaryGreen, fontSize: 16))
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pickup At",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          "Mira Road",
                          style: TextStyle(
                              color: LTheme.primaryGreen, fontSize: 16),
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
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          "St. Vincent Mira Road Lokhandwala",
                          style: TextStyle(
                              color: LTheme.primaryGreen, fontSize: 16),
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
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text("Rs. 0.00",
                          style: TextStyle(
                              color: LTheme.primaryGreen, fontSize: 16))
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Accident Insurance",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text("Rs. 0.00",
                          style: TextStyle(
                              color: LTheme.primaryGreen, fontSize: 16))
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text("Rs. 1897.57",
                          style: TextStyle(
                              color: LTheme.primaryGreen, fontSize: 16))
                    ],
                  ),
                  SizedBox(height: 8.0),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Paymentoptions()));
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
                            fontSize: 17,
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
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
