import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartambulance/themes/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class AmbulanceReasonScreen extends StatefulWidget {
  final VoidCallback onNextPage;

  AmbulanceReasonScreen({required this.onNextPage});
  @override
  _AmbulanceReasonScreenState createState() => _AmbulanceReasonScreenState();
}

class _AmbulanceReasonScreenState extends State<AmbulanceReasonScreen> {
  bool _isExpanded = false;
  String areasonSelected = "";
  bool _doctorRequired = false;

  void _onCheckboxChanged(bool? value) {
    setState(() {
      _doctorRequired = value ?? false;
    });
  }

  double getResponsiveFontSize(double baseSize) {
    return MediaQuery.of(context).size.width / 375 * baseSize;
  }

  @override
  Widget build(BuildContext context) {
    var GlobalWidth = MediaQuery.of(context).size.width;
    var GlobalHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: LTheme.sbgcolor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
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
                "Ambulance Reason",
                style: GoogleFonts.inter(
                    color: LTheme.primaryGreen,
                    fontSize: getResponsiveFontSize(25),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: _isExpanded ? 360 : 290,
                  decoration: BoxDecoration(
                      color: LTheme.lightGreen,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView(
                    padding: EdgeInsets.only(top: 8),
                    children: [
                      InkWell(
                        onTap: () {
                          areasonSelected = "Basic";
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
                          areasonSelected = "ICU";
                          widget.onNextPage();
                        },
                        child: ListTile(
                          title: Text(
                            'ICU',
                            style: GoogleFonts.inter(
                                color: LTheme.primaryGreen,
                                fontSize: getResponsiveFontSize(20)),
                          ),
                        ),
                      ),
                      _isExpanded
                          ? SizedBox(height: 1)
                          : const Divider(
                              color: Colors.black54,
                              thickness: 1,
                            ),
                      ExpansionTile(
                        title: Text(
                          'Pediatric',
                          style: GoogleFonts.inter(
                              color: LTheme.primaryGreen,
                              fontSize: getResponsiveFontSize(20)),
                        ),
                        trailing: _isExpanded
                            ? Icon(Icons.remove, color: LTheme.primaryGreen)
                            : Icon(Icons.add, color: LTheme.primaryGreen),
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                activeColor: LTheme.primaryGreen,
                                value: _doctorRequired,
                                onChanged: _onCheckboxChanged,
                              ),
                              Text(
                                'Doctor Required?',
                                style: GoogleFonts.inter(
                                    fontSize: getResponsiveFontSize(17),
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: GlobalWidth * 0.7),
                            child: InkWell(
                              onTap: () {
                                areasonSelected = "Pediatric";
                                widget.onNextPage();
                              },
                              child: Icon(Icons.arrow_forward_rounded,
                                  color: LTheme.primaryGreen, size: 30),
                            ),
                          )
                        ],
                        childrenPadding: EdgeInsets.only(bottom: 10),
                        onExpansionChanged: (bool expanded) {
                          setState(() {
                            _isExpanded = expanded;
                          });
                        },
                      ),
                      _isExpanded
                          ? SizedBox(height: 1)
                          : const Divider(
                              color: Colors.black54,
                              thickness: 1,
                            ),
                      InkWell(
                        onTap: () {
                          areasonSelected = "Deadbody";
                          widget.onNextPage();
                        },
                        child: ListTile(
                          title: Text(
                            'Deadbody',
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
