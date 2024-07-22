import 'package:flutter/material.dart';

class O3 extends StatelessWidget {
  const O3({super.key});

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
                    Image.asset('assets/onboarding/o3.png'),
                    const SizedBox(height: 13),
                    // const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: const Text(
                        "Smart Ambulance: fast response, real-time tracking, and advanced diagnostics for critical care and quick services.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16.0, // Fixed font size
                          color: Colors.grey,
                          letterSpacing: -0.41,
                          height: 1.4,
                        ),
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
