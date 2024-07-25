import 'package:flutter/material.dart';
import 'package:smartambulance/initialscreens/Ambulance/areason.dart';
import 'package:smartambulance/initialscreens/Ambulance/asize.dart';
import 'package:smartambulance/initialscreens/Ambulance/atype.dart';
import 'package:smartambulance/initialscreens/Booking/nearestambulance.dart';
import 'package:smartambulance/initialscreens/Ambulance/needhelper.dart';
import 'package:smartambulance/initialscreens/Ambulance/patient.dart';
import 'package:smartambulance/initialscreens/Ambulance/timeprice.dart';
import 'package:smartambulance/themes/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Ambulance extends StatefulWidget {
  const Ambulance({super.key});

  @override
  State<Ambulance> createState() => _AmbulanceState();
}

class _AmbulanceState extends State<Ambulance> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          children: [
            AmbulanceReasonScreen(),
            Atype(),
            Asize(),
            Patient(),
            NeedHelper(),
            TimePrice()
          ],
        ),
        Align(
          alignment: Alignment(-0.9, -0.8),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        Container(
          alignment: Alignment(0, 0.8),
          child: SmoothPageIndicator(
            controller: _controller,
            count: 6,
            effect: ExpandingDotsEffect(
                activeDotColor: LTheme.primaryGreen,
                dotColor: LTheme.secondaryGreen,
                dotHeight: 12,
                dotWidth: 18),
          ),
        )
      ],
    ));
  }
}
