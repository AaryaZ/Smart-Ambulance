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

  double getResponsiveFontSize(double baseSize) {
    return MediaQuery.of(context).size.width / 375 * baseSize;
  }

  @override
  Widget build(BuildContext context) {
    var GlobalWidth = MediaQuery.of(context).size.width;
    var GlobalHeight = MediaQuery.of(context).size.height;
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
            children: [O1(), O2(), O3()]),
        Container(
            height: GlobalHeight * 0.3,

            // color: Colors.amber,
            child: Column(
              children: [
                Flexible(
                    child: FractionallySizedBox(
                  heightFactor: 0.1,
                )),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      activeDotColor: LTheme.primaryGreen,
                      dotColor: LTheme.secondaryGreen,
                      dotHeight: 12,
                      dotWidth: 18),
                ),
                Flexible(
                    child: FractionallySizedBox(
                  heightFactor: 0.5,
                )),
                GestureDetector(
                    onTap: () {
                      getstartedPage
                          ? Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false)
                          : _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOutCirc);
                    },
                    child: getstartedPage
                        ? Container(
                            height: GlobalHeight * 0.08,
                            width: GlobalWidth * 0.9,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: LTheme.primaryGreen,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              "GET STARTED",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: getResponsiveFontSize(17),
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          )
                        : Container(
                            height: GlobalHeight * 0.08,
                            width: GlobalWidth * 0.9,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: LTheme.primaryGreen,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              "NEXT",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: getResponsiveFontSize(17),
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          )),
                Flexible(
                    child: FractionallySizedBox(
                  heightFactor: 0.3,
                )),
                getstartedPage
                    ? SizedBox(
                        height: 10,
                      )
                    : GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                          // _controller.jumpToPage(2);
                        },
                        child: Container(
                          height: GlobalHeight * 0.08,
                          width: GlobalWidth * 0.9,
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
                            "SKIP",
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
            ))
      ],
    ));
  }
}
