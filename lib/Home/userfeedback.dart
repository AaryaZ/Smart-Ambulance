import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartambulance/Home/navbar.dart';
import 'package:smartambulance/themes/theme.dart';

class FScreen extends StatefulWidget {
  const FScreen({super.key});

  @override
  State<FScreen> createState() => _FScreenState();
}

class _FScreenState extends State<FScreen> {
  double getResponsiveFontSize(double baseSize) {
    return MediaQuery.of(context).size.width / 375 * baseSize;
  }

  final List<String> _options = [
    'Arrival Time',
    'Professionalism',
    'Trip Route',
    'Driving',
    'Ambulance Quality',
    'Medical Equipments',
    'Others',
  ];
  final List<String> _selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home/map.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            color: LTheme.lightGreen.withOpacity(0.2),
            child: Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text("Feedback",
                                    style: GoogleFonts.inter(
                                        color: Colors.grey[700],
                                        fontSize: getResponsiveFontSize(18))),
                                Text("How can we make it better?",
                                    style: GoogleFonts.inter(
                                        color: Colors.grey,
                                        fontSize: getResponsiveFontSize(14))),
                              ],
                            ),
                            Wrap(
                              spacing: 4.0,
                              children: _options.map((option) {
                                return ChoiceChip(
                                  backgroundColor: Colors.white,
                                  label: Text(option,
                                      style: GoogleFonts.inter(
                                          color: Colors.grey[400])),
                                  selectedColor: LTheme.primaryGreen,
                                  selected: _selectedOptions.contains(option),
                                  onSelected: (selected) {
                                    setState(() {
                                      if (selected) {
                                        _selectedOptions.add(option);
                                      } else {
                                        _selectedOptions.remove(option);
                                      }
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                            TextFormField(
                              minLines: 3,
                              maxLines: 5,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  hintText: "Write a messsage ...",
                                  hintStyle: GoogleFonts.inter(
                                      color: Colors.grey, fontSize: 12),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      await removeFeeback();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BottomNav()));
                                    },
                                    child: Container(
                                      height: 45,
                                      width: screenWidth * 0.7,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: LTheme.primaryGreen,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        "Submit",
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: getResponsiveFontSize(14),
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await removeFeeback();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BottomNav()));
                                  },
                                  child: Container(
                                    height: 45,
                                    width: screenWidth * 0.7,
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
                                      "Not Now",
                                      style: GoogleFonts.inter(
                                        color: LTheme.primaryGreen,
                                        fontSize: getResponsiveFontSize(14),
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ))),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

Future<void> removeFeeback() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('currentbooking', false);
}
