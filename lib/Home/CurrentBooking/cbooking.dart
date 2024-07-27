import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartambulance/Home/navbar.dart';
import 'package:smartambulance/themes/theme.dart';

class Cbooking extends StatefulWidget {
  const Cbooking({super.key});

  @override
  State<Cbooking> createState() => _CbookingState();
}

Future<void> askFeeback() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('currentbooking', true);
}

class _CbookingState extends State<Cbooking> {
  @override
  void initState() {
    super.initState();
    askFeeback();
  }

  double getResponsiveFontSize(double baseSize) {
    return MediaQuery.of(context).size.width / 375 * baseSize;
  }

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
                height: 70,
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
                height: 20,
              ),
              Text(
                " Patient Details",
                style: TextStyle(
                    color: LTheme.primaryGreen,
                    fontSize: getResponsiveFontSize(25),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/home/map.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text("Arrival in 2 minutes",
                  style: GoogleFonts.inter(
                      fontSize: getResponsiveFontSize(17),
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600])),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: LTheme.secondaryGreen,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 20.0,
                          backgroundColor: LTheme.primaryGreen,
                          child: Image.asset('assets/home/userlocation.png')),
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Divider(
                              color: LTheme.primaryGreen,
                              thickness: 3.0,
                              height: 40.0,
                            ),
                            Positioned(
                              top: 0,
                              child: Text(
                                '800 m',
                                style: TextStyle(
                                    color: LTheme.primaryGreen,
                                    fontSize: getResponsiveFontSize(12),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: LTheme.primaryGreen,
                        child: Image.asset('assets/home/vehicle.png'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Driver Name",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Text("Arjun Sethi",
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
                        "Hospital",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Text("St. Vincent Hospital",
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
                        "Ambulance No. ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Text("MH43AU7829",
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
                        "Ambulance Type",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Text(
                        "Basic",
                        style: TextStyle(
                            color: LTheme.primaryGreen,
                            fontSize: getResponsiveFontSize(16)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        // textDirection: TextDirection.rtl,
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ambulance Size",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Text(
                        "ECO",
                        style: TextStyle(
                            color: LTheme.primaryGreen,
                            fontSize: getResponsiveFontSize(16)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        // textDirection: TextDirection.rtl,
                      )
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Doctor Available",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Text("Yes",
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
                        "Number of Patients",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Text("1",
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
                        "Helpers",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Text("2",
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
                        "Booking Time",
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
                        "Total Price",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: getResponsiveFontSize(16)),
                      ),
                      Text("Rs. 1897.57",
                          style: TextStyle(
                              color: LTheme.primaryGreen,
                              fontWeight: FontWeight.w600,
                              fontSize: getResponsiveFontSize(16)))
                    ],
                  ),
                  SizedBox(height: 8.0),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 45,
                        width: screenWidth * 0.35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: LTheme.primaryGreen,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          "Call",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: getResponsiveFontSize(17),
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showConfirmationDialog(context);
                    },
                    child: Container(
                      height: 45,
                      width: screenWidth * 0.35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: LTheme.secondaryGreen,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
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
              ),
              SizedBox(
                height: 50,
              ),
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
                      onTap: () async {
                        Navigator.of(context).pop();
                        _showCancellationDialog(context);
                        await saveCurrentBookingData();
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
                            MaterialPageRoute(
                                builder: (context) => BottomNav()),
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

Future<void> saveCurrentBookingData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('booking_confirmed', false);
}
