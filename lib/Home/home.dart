import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:smartambulance/Home/Ambulance/ambulance.dart';
import 'package:smartambulance/Home/CurrentBooking/cbooking.dart';
import 'package:smartambulance/Home/userfeedback.dart';

import 'package:smartambulance/themes/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showFeedback = false;
  double getResponsiveFontSize(double baseSize) {
    return MediaQuery.of(context).size.width / 375 * baseSize;
  }

  double getConatinerFontSize(double baseSize) {
    return MediaQuery.of(context).size.width * 0.9 / 375 * baseSize;
  }

  Future<void> _showFeedback() async {
    final prefs = await SharedPreferences.getInstance();
    print("hello${showFeedback}");
    setState(() {
      showFeedback = prefs.getBool('currentbooking') ?? false;
    });
    print("hello${showFeedback}");
  }

  @override
  void initState() {
    super.initState();
    _showFeedback();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool hasBooked = false;

    Future<void> _checkCurrentBooking() async {
      final prefs = await SharedPreferences.getInstance();
      print(hasBooked);
      setState(() {
        hasBooked = prefs.getBool('booking_confirmed') ?? false;
      });
      print(hasBooked);
    }

    return Scaffold(
      // appBar: buildAppBar(),
      backgroundColor: LTheme.sbgcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: screenWidth * 0.4,
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: 'Hey,\n',
                              style: TextStyle(
                                fontSize: getResponsiveFontSize(24),
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            TextSpan(
                              text: 'What Happened?',
                              style: TextStyle(
                                fontSize: getResponsiveFontSize(22),
                                fontWeight: FontWeight.bold,
                                color: LTheme.primaryGreen,
                              ),
                            ),
                          ]))),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          height: 35,
                          width: screenWidth * 0.4,
                          // color: Colors.amber,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            border: Border.all(
                              color: Colors.white54,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.location_on, color: Colors.red),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'M.G.Road,Virar ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ])),
                    ),
                  )
                ],
              ),
              SizedBox(height: 35),
              Container(
                height: 200, // Set the height of the container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/home/map.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              SlideAction(
                borderRadius: 14,
                elevation: 0,
                innerColor: LTheme.primaryGreen,
                outerColor: LTheme.secondaryGreen,
                textColor: LTheme.primaryGreen,
                sliderButtonIcon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                text: '          Swipe to Book an Ambulance',
                textStyle: TextStyle(
                    fontSize: getResponsiveFontSize(15),
                    fontWeight: FontWeight.w700,
                    color: LTheme.primaryGreen,
                    leadingDistribution: TextLeadingDistribution.proportional),
                sliderRotate: false,
                animationDuration: Duration(milliseconds: 10),
                sliderButtonYOffset: 0,
                onSubmit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ambulance()),
                  );
                },
              ),
              SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    'CURRENT BOOKING',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              (showFeedback == true)
                  ? Container(
                      height: 190,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ride Completed',
                              style: GoogleFonts.inter(
                                color: Colors.grey[600],
                                fontSize: getResponsiveFontSize(16),
                              ),
                            ),
                            Text(
                              'Rate your Ambulance Ride',
                              style: GoogleFonts.inter(
                                color: Colors.grey,
                                fontSize: getResponsiveFontSize(12),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: RatingBar(
                                allowHalfRating: true,
                                ratingWidget: RatingWidget(
                                    full: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    half: Icon(
                                      Icons.star_half_outlined,
                                      color: Colors.amber,
                                    ),
                                    empty: Icon(
                                      Icons.star,
                                      color: Colors.grey[300],
                                    )),
                                onRatingUpdate: _saveRatingUpdate,
                                glow: false,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () async {
                                await removeFeeback();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: LTheme.primaryGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Feedback',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getResponsiveFontSize(16),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 0,
                    ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  await _checkCurrentBooking();
                  (hasBooked == true)
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cbooking()))
                      : null;
                },
                child: Container(
                  height: 190,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2 minutes away',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(16),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: LTheme.secondaryGreen,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: LTheme.primaryGreen,
                                    child: Image.asset(
                                        'assets/home/userlocation.png')),
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
                                              fontSize:
                                                  getResponsiveFontSize(12),
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
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: LTheme.primaryGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                          ),
                          child: Center(
                            child: Text(
                              'Call',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: getResponsiveFontSize(16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    'AMBULANCE',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 10,
                    ),
                  ),
                ],
              ),
//-------------------------------------------------------------------
              SizedBox(height: 8),
              Container(
                  width: screenWidth * 0.9,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(12.0),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey.withOpacity(0.6),
                                //     spreadRadius: 2,
                                //     blurRadius: 5,
                                //     offset: Offset(0, 3),
                                //   ),
                                // ],
                              ),
                              child: FittedBox(
                                child: Image.asset(
                                  'assets/home/Large.png',
                                  height: 50,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Large Ambulance",
                                  style: GoogleFonts.inter(
                                      fontSize: getConatinerFontSize(14)),
                                ),
                                Text(
                                  "Comfy and Spacious",
                                  style: GoogleFonts.inter(
                                      fontSize: getConatinerFontSize(12),
                                      color: Colors.grey),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Rs. 1375",
                                  style: GoogleFonts.inter(
                                      color: LTheme.primaryGreen,
                                      fontWeight: FontWeight.w600,
                                      fontSize: getConatinerFontSize(14)),
                                ),
                                Text(
                                  "Large",
                                  style: GoogleFonts.inter(
                                      fontSize: getConatinerFontSize(12)),
                                )
                              ],
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: screenWidth * 0.85,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: LTheme.lightGreen,
                              border: Border.all(
                                color: LTheme.secondaryGreen,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Book Your Ambulance",
                                  style: GoogleFonts.inter(
                                    color: LTheme.primaryGreen,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                Icon(Icons.arrow_forward_rounded,
                                    color: LTheme.primaryGreen)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
//-------------------------------
              SizedBox(height: 20),
              Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(12.0),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey.withOpacity(0.6),
                                //     spreadRadius: 2,
                                //     blurRadius: 5,
                                //     offset: Offset(0, 3),
                                //   ),
                                // ],
                              ),
                              child: FittedBox(
                                child: Image.asset(
                                  'assets/home/Medium.png',
                                  height: 50,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Medium Ambulance",
                                  style: GoogleFonts.inter(
                                      fontSize: getConatinerFontSize(14)),
                                ),
                                Text(
                                  "Cozy and Affordable",
                                  style: GoogleFonts.inter(
                                      fontSize: getConatinerFontSize(12),
                                      color: Colors.grey),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Rs. 975",
                                  style: GoogleFonts.inter(
                                      color: LTheme.primaryGreen,
                                      fontWeight: FontWeight.w600,
                                      fontSize: getConatinerFontSize(14)),
                                ),
                                Text(
                                  "Medium",
                                  style: GoogleFonts.inter(
                                      fontSize: getConatinerFontSize(12)),
                                )
                              ],
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: screenWidth * 0.85,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: LTheme.lightGreen,
                              border: Border.all(
                                color: LTheme.secondaryGreen,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Book Your Ambulance",
                                  style: GoogleFonts.inter(
                                    color: LTheme.primaryGreen,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                Icon(Icons.arrow_forward_rounded,
                                    color: LTheme.primaryGreen)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              //-------------------------------
              SizedBox(height: 20),
              Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(12.0),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey.withOpacity(0.6),
                                //     spreadRadius: 2,
                                //     blurRadius: 5,
                                //     offset: Offset(0, 3),
                                //   ),
                                // ],
                              ),
                              child: FittedBox(
                                child: Image.asset(
                                  'assets/home/Eco.png',
                                  height: 50,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "ECO Ambulance",
                                  style: GoogleFonts.inter(
                                      fontSize: getConatinerFontSize(14)),
                                ),
                                Text(
                                  "Affordable",
                                  style: GoogleFonts.inter(
                                      fontSize: getConatinerFontSize(12),
                                      color: Colors.grey),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Rs. 775",
                                  style: GoogleFonts.inter(
                                      color: LTheme.primaryGreen,
                                      fontWeight: FontWeight.w600,
                                      fontSize: getConatinerFontSize(14)),
                                ),
                                Text(
                                  "ECO",
                                  style: GoogleFonts.inter(
                                      fontSize: getConatinerFontSize(12)),
                                )
                              ],
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: screenWidth * 0.85,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: LTheme.lightGreen,
                              border: Border.all(
                                color: LTheme.secondaryGreen,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Book Your Ambulance",
                                  style: GoogleFonts.inter(
                                    color: LTheme.primaryGreen,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                Icon(Icons.arrow_forward_rounded,
                                    color: LTheme.primaryGreen)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
//-------------------------------------------------------------------
            ],
          ),
        ),
      ),
    );
  }
}

void _saveRatingUpdate(rating) {
  print(rating);
}

Future<void> removeFeeback() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('currentbooking', false);
}
