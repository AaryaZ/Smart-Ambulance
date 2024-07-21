import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/initialscreens/Login/login.dart';
import 'package:smartambulance/initialscreens/oscreens/o1.dart';
import 'package:smartambulance/initialscreens/oscreens/o2.dart';
import 'package:smartambulance/initialscreens/oscreens/o3.dart';
import 'package:smartambulance/themes/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _controller = PageController();
  bool getstartedPage = false;
  
  @override
  Widget build(BuildContext context) {
    var GlobalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (idx) {
              setState(() {
                getstartedPage = (idx == 2);
              });
            },
            children: [O1(), O2(), O3()],
          ),
          Positioned(
            bottom: 244,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: LTheme.primaryGreen,
                dotColor: LTheme.secondaryGreen,
                dotHeight: 12,
                dotWidth: 18,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 220,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    getstartedPage
                      ? Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                          (route) => false,
                        )
                      : _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOutCirc,
                        );
                  },
                  child: Container(
                    height: 50, // Reduced height
                    width: GlobalWidth * 0.9,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: LTheme.primaryGreen,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      getstartedPage ? "GET STARTED" : "NEXT",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                getstartedPage
                  ? SizedBox(
                      height: 10,
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                          (route) => false,
                        );
                      },
                      child: Container(
                        height: 50, // Reduced height
                        width: GlobalWidth * 0.9,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: LTheme.secondaryGreen,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          "SKIP",
                          style: GoogleFonts.inter(
                            color: LTheme.primaryGreen,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
