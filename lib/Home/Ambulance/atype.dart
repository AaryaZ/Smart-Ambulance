import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/themes/theme.dart';

class Atype extends StatefulWidget {
  final VoidCallback onNextPage;
  final VoidCallback onPrevPage;

  Atype({required this.onNextPage, required this.onPrevPage});

  @override
  State<Atype> createState() => _AtypeState();
}

class _AtypeState extends State<Atype> {
  String atypeSelected = "";
  @override
  Widget build(BuildContext context) {
    var GlobalWidth = MediaQuery.of(context).size.width;
    var GlobalHeight = MediaQuery.of(context).size.height;

    double getResponsiveFontSize(double baseSize) {
      return MediaQuery.of(context).size.width / 375 * baseSize;
    }

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: LTheme.sbgcolor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => widget.onPrevPage(),
          child: const Icon(
            Icons.arrow_back_rounded,
            color: LTheme.primaryGreen,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 18),
        child: Container(
          height: GlobalHeight * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Ambulance Type",
                style: GoogleFonts.inter(
                    color: LTheme.primaryGreen,
                    fontSize: getResponsiveFontSize(25),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 290,
                  decoration: BoxDecoration(
                      color: LTheme.lightGreen,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView(
                    padding: EdgeInsets.only(top: 10),
                    children: [
                      InkWell(
                        onTap: () {
                          atypeSelected = "Basic";
                          widget.onNextPage();
                        },
                        child: ListTile(
                          title: Text(
                            'Basic',
                            style: GoogleFonts.inter(
                                color: LTheme.primaryGreen,
                                fontSize: getResponsiveFontSize(20)),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.black54,
                        thickness: 1,
                      ),
                      InkWell(
                        onTap: () {
                          atypeSelected = "ICU Ventilator";
                          widget.onNextPage();
                        },
                        child: ListTile(
                          title: Text(
                            'ICU Ventilator',
                            style: GoogleFonts.inter(
                                color: LTheme.primaryGreen,
                                fontSize: getResponsiveFontSize(20)),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black54,
                        thickness: 1,
                      ),
                      InkWell(
                        onTap: () {
                          atypeSelected = "Mortuary";
                          widget.onNextPage();
                        },
                        child: ListTile(
                          title: Text(
                            'Mortuary',
                            style: GoogleFonts.inter(
                                color: LTheme.primaryGreen,
                                fontSize: getResponsiveFontSize(20)),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black54,
                        thickness: 1,
                      ),
                      InkWell(
                        onTap: () {
                          atypeSelected = "Oxygen Facility";
                          widget.onNextPage();
                        },
                        child: ListTile(
                          title: Text(
                            'Oxygen Facility',
                            style: GoogleFonts.inter(
                                color: LTheme.primaryGreen,
                                fontSize: getResponsiveFontSize(20)),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
