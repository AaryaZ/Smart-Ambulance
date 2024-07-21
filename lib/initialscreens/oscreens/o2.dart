import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/themes/theme.dart';

class O2 extends StatelessWidget {
  const O2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
        child: Column(
          children: [
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/onboarding/o2.png'),
                    const SizedBox(height: 13),
                    Text(
                      "Smart Ambulance",
                      style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: LTheme.primaryGreen),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Transform emergency care with Smart Ambulance: real-time tracking, quick diagnostics, and efficient routing.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.0, // Fixed font size
                        color: Colors.grey,
                        letterSpacing: -0.41,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 100),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
