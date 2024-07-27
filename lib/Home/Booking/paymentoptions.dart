import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/Home/Booking/razorpay.dart';
import 'package:smartambulance/themes/theme.dart';

class Paymentoptions extends StatefulWidget {
  const Paymentoptions({super.key});

  @override
  State<Paymentoptions> createState() => _PaymentoptionsState();
}

class _PaymentoptionsState extends State<Paymentoptions> {
  double getResponsiveFontSize(double baseSize) {
    return MediaQuery.of(context).size.width / 375 * baseSize;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 18),
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
              "Payment Options",
              style: GoogleFonts.inter(
                  color: LTheme.primaryGreen,
                  fontSize: getResponsiveFontSize(22),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Razorpay()));
                  },
                  child: Container(
                      height: 200,
                      width: screenWidth * 0.9,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: LTheme.primaryGreen,
                          width: 1.0,
                        ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FittedBox(
                              child: Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                      "assets/payment/onlinepayment.png"))),
                          Text("Online Payment",
                              style: GoogleFonts.inter(fontSize: 18)),
                        ],
                      )),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: 200,
                      width: screenWidth * 0.9,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: LTheme.primaryGreen,
                          width: 1.0,
                        ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FittedBox(
                            child: Container(
                                height: 100,
                                width: 100,
                                child: Image.asset("assets/payment/cash.png")),
                            fit: BoxFit.scaleDown,
                          ),
                          Text("Cash", style: GoogleFonts.inter(fontSize: 18)),
                        ],
                      )),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
