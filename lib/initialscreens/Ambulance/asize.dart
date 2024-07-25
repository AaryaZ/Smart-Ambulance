import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/themes/theme.dart';

class Asize extends StatefulWidget {
  const Asize({super.key});

  @override
  State<Asize> createState() => _AsizeState();
}

class _AsizeState extends State<Asize> {
  bool _isLExpanded = false;
  bool _isSExpanded = false;
  bool _isMExpanded = false;
  int updateH() {
    int c = 0;
    if (_isLExpanded) c++;
    if (_isSExpanded) c++;
    if (_isMExpanded) c++;
    if (c == 3) {
      h = 3;
    } else if (c == 2) {
      h = 2;
    } else if (c == 1) {
      h = 1;
    } else {
      h = 0;
    }
    return h;
  }

  int h = 0;
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
              "Ambulance Size",
              style: TextStyle(
                  color: LTheme.primaryGreen,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: (updateH() == 3)
                    ? 455
                    : (updateH() == 2)
                        ? 365
                        : (updateH() == 1)
                            ? 290
                            : 210,
                decoration: BoxDecoration(
                  color: LTheme.lightGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    ExpansionTile(
                      title: Text(
                        'Large',
                        style:
                            TextStyle(color: LTheme.primaryGreen, fontSize: 20),
                      ),
                      trailing: _isLExpanded
                          ? Icon(Icons.remove, color: LTheme.primaryGreen)
                          : Icon(Icons.add, color: LTheme.primaryGreen),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                    "Capacity of 3 people,\n Equipments include BLS,\n Oxygen Cylinder with mask,First Aid Kit,\n Suction Machine",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 13)),
                              ),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Image.asset("assets/home/Large.png"),
                                  SizedBox(height: 10),
                                  GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 30,
                                        width: 80,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: LTheme.primaryGreen,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Text(
                                          "SELECT",
                                          style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                      childrenPadding: EdgeInsets.only(bottom: 10),
                      onExpansionChanged: (bool expanded) {
                        setState(() {
                          _isLExpanded = expanded;
                        });
                      },
                    ),
                    (_isLExpanded || _isMExpanded)
                        ? SizedBox(height: 1)
                        : Divider(
                            color: Colors.black54,
                            thickness: 1,
                          ),
                    ExpansionTile(
                      title: Text(
                        'Medium',
                        style:
                            TextStyle(color: LTheme.primaryGreen, fontSize: 20),
                      ),
                      trailing: _isMExpanded
                          ? Icon(Icons.remove, color: LTheme.primaryGreen)
                          : Icon(Icons.add, color: LTheme.primaryGreen),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                    "Capacity of 3 people,\n Equipments include BLS,\n Oxygen Cylinder with mask,First Aid Kit,\n Suction Machine",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 13)),
                              ),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Image.asset("assets/home/Medium.png"),
                                  SizedBox(height: 10),
                                  GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 30,
                                        width: 80,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: LTheme.primaryGreen,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Text(
                                          "SELECT",
                                          style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                      childrenPadding: EdgeInsets.only(bottom: 10),
                      onExpansionChanged: (bool expanded) {
                        setState(() {
                          _isMExpanded = expanded;
                        });
                      },
                    ),
                    (_isSExpanded || _isMExpanded)
                        ? SizedBox(height: 1)
                        : const Divider(
                            color: Colors.black54,
                            thickness: 1,
                          ),
                    ExpansionTile(
                      title: Text(
                        'ECO',
                        style:
                            TextStyle(color: LTheme.primaryGreen, fontSize: 20),
                      ),
                      trailing: _isSExpanded
                          ? Icon(Icons.remove, color: LTheme.primaryGreen)
                          : Icon(Icons.add, color: LTheme.primaryGreen),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                    "Capacity of 3 people,\n Equipments include BLS,\n Oxygen Cylinder with mask,First Aid Kit,\n Suction Machine",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 13)),
                              ),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Image.asset("assets/home/Eco.png"),
                                  SizedBox(height: 10),
                                  GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 30,
                                        width: 80,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: LTheme.primaryGreen,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Text(
                                          "SELECT",
                                          style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                      childrenPadding: EdgeInsets.only(bottom: 10),
                      onExpansionChanged: (bool expanded) {
                        setState(() {
                          _isSExpanded = expanded;
                        });
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
