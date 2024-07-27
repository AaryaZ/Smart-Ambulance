import 'package:flutter/material.dart';
import 'package:smartambulance/Home/Ambulance/areason.dart';
import 'package:smartambulance/Home/Ambulance/asize.dart';
import 'package:smartambulance/Home/Ambulance/atype.dart';
import 'package:smartambulance/Home/Ambulance/needhelper.dart';
import 'package:smartambulance/Home/Ambulance/patient.dart';
import 'package:smartambulance/Home/Ambulance/timeprice.dart';
import 'package:smartambulance/themes/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Ambulance extends StatefulWidget {
  const Ambulance({super.key});

  @override
  State<Ambulance> createState() => _AmbulanceState();
}

class _AmbulanceState extends State<Ambulance> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      // Ensure we are only updating the state if page is available
      if (_pageController.hasClients) {
        final page = _pageController.page;
        if (page != null) {
          setState(() {
            _currentPage = page.round();
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_pageController.page != null && _pageController.page! < 5) {
      _pageController.animateToPage(
        _pageController.page!.toInt() + 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCirc,
      );
    }
  }

  void _prevPage() {
    if (_pageController.page != null && _pageController.page! >= 1) {
      _pageController.animateToPage(
        _pageController.page!.toInt() - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
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
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            AmbulanceReasonScreen(onNextPage: _nextPage),
            Atype(onNextPage: _nextPage, onPrevPage: _prevPage),
            Asize(onNextPage: _nextPage, onPrevPage: _prevPage),
            Patient(onNextPage: _nextPage, onPrevPage: _prevPage),
            NeedHelper(onNextPage: _nextPage, onPrevPage: _prevPage),
            TimePrice(onPrevPage: _prevPage)
          ],
        ),
        (_currentPage != 3)
            ? Container(
                height: GlobalHeight * 0.1,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 6,
                  effect: ExpandingDotsEffect(
                      activeDotColor: LTheme.primaryGreen,
                      dotColor: LTheme.secondaryGreen,
                      dotHeight: 12,
                      dotWidth: 18),
                ),
              )
            : SizedBox(height: 20)
      ],
    ));
  }
}
