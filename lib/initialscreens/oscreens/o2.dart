import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/themes/theme.dart';

class O2 extends StatelessWidget {
  const O2({super.key});

  @override
  Widget build(BuildContext context) {
    double getResponsiveFontSize(double baseSize) {
      return MediaQuery.of(context).size.width / 375 * baseSize;
    }

    var GlobalHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
        child: Container(
          height: GlobalHeight * 0.7,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(
                child: FractionallySizedBox(
              heightFactor: 0.4,
            )),
            Image.asset('assets/onboarding/o2.png'),
            Flexible(
                child: FractionallySizedBox(
              heightFactor: 0.2,
            )),
            Text(
              "Smart Ambulance",
              style: GoogleFonts.inter(
                  fontSize: getResponsiveFontSize(24.0),
                  fontWeight: FontWeight.w600,
                  color: LTheme.primaryGreen),
            ),
            Flexible(
                child: FractionallySizedBox(
              heightFactor: 0.3,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Transform emergency care with Smart Ambulance: real-time tracking, quick diagnostics, and efficient routing.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: getResponsiveFontSize(16.0),
                  color: Colors.grey,
                  letterSpacing: -0.41,
                  height: 1.4,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
