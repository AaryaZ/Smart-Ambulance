import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartambulance/themes/theme.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AmbulanceReasonScreen(),
    );
  }
}

class AmbulanceReasonScreen extends StatefulWidget {
  @override
  _AmbulanceReasonScreenState createState() => _AmbulanceReasonScreenState();
}

class _AmbulanceReasonScreenState extends State<AmbulanceReasonScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
            ),
            Text(
              "Ambulance Reason",
              style: TextStyle(
                  color: LTheme.primaryGreen,
                  fontSize: 25,
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
                    const ListTile(
                      title: Text(
                        'Basic',
                        style:
                            TextStyle(color: LTheme.primaryGreen, fontSize: 20),
                      ),
                    ),
                    Divider(
                      color: Colors.black54,
                      thickness: 1,
                    ),
                    const ListTile(
                      title: Text(
                        'ICU',
                        style:
                            TextStyle(color: LTheme.primaryGreen, fontSize: 20),
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
                        style:
                            TextStyle(color: LTheme.primaryGreen, fontSize: 20),
                      ),
                      trailing: _isExpanded
                          ? Icon(Icons.remove, color: LTheme.primaryGreen)
                          : Icon(Icons.add, color: LTheme.primaryGreen),
                      children: [
                        ListTile(
                          title: Text(
                            'Doctor Required?',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 30,
                                    width: 80,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: LTheme.primaryGreen,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Text(
                                      "YES",
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  )),
                              GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 30,
                                    width: 80,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: LTheme.primaryGreen,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Text(
                                      "NO",
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
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
                    const ListTile(
                      title: Text(
                        'Deadbody',
                        style:
                            TextStyle(color: LTheme.primaryGreen, fontSize: 20),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
