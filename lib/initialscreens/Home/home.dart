import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:smartambulance/initialscreens/Ambulance/ambulance.dart';
import 'package:smartambulance/initialscreens/Ambulance/atype.dart';
import 'package:smartambulance/initialscreens/Home/option.dart';
import 'package:smartambulance/themes/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: 'Hey,\n',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          TextSpan(
                            text: 'What Happened?',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: LTheme.primaryGreen,
                            ),
                          ),
                        ]))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                        height: 35,
                        width: 150,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.location_on, color: Colors.red),
                              Text(
                                'M.G.Road,Virar',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ])),
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
                text: '        Swipe to Book an Ambulance',
                textStyle: TextStyle(
                    fontSize: 18,
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
              Container(
                height: 190,
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(12)),
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
                          fontSize: 16.0,
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
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                            fontSize: 14.0,
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
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                  height: 180,
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(12)),
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
                                color: Colors.grey[200],
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
                                  style: GoogleFonts.inter(fontSize: 15),
                                ),
                                Text(
                                  "Comfy and Spacious",
                                  style: GoogleFonts.inter(
                                      fontSize: 12, color: Colors.grey),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rs. 1375",
                                  style: GoogleFonts.inter(fontSize: 15),
                                ),
                                Text(
                                  "Large",
                                  style: GoogleFonts.inter(fontSize: 12),
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
                            child: Text(
                              "Book Your Ambulance",
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
                    ),
                  )),
//-------------------------------
              SizedBox(height: 8),
              Container(
                  height: 180,
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(12)),
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
                                color: Colors.grey[200],
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
                                  style: GoogleFonts.inter(fontSize: 15),
                                ),
                                Text(
                                  "Cozy and Affordable",
                                  style: GoogleFonts.inter(
                                      fontSize: 12, color: Colors.grey),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rs. 975",
                                  style: GoogleFonts.inter(fontSize: 15),
                                ),
                                Text(
                                  "Medium",
                                  style: GoogleFonts.inter(fontSize: 12),
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
                            child: Text(
                              "Book Your Ambulance",
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
                    ),
                  )),
              //-------------------------------
              SizedBox(height: 8),
              Container(
                  height: 180,
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(12)),
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
                                color: Colors.grey[200],
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
                                  style: GoogleFonts.inter(fontSize: 15),
                                ),
                                Text(
                                  "Affordable",
                                  style: GoogleFonts.inter(
                                      fontSize: 12, color: Colors.grey),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rs. 775",
                                  style: GoogleFonts.inter(fontSize: 15),
                                ),
                                Text(
                                  "ECO",
                                  style: GoogleFonts.inter(fontSize: 12),
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
                            child: Text(
                              "Book Your Ambulance",
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
