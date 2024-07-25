import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/themes/theme.dart';

class NeedHelper extends StatefulWidget {
  const NeedHelper({super.key});

  @override
  State<NeedHelper> createState() => _NeedHelperState();
}

class _NeedHelperState extends State<NeedHelper> {
  bool _isExpanded = false;
  int helper = 2;

  void _increment() {
    setState(() {
      helper++;
    });
  }

  void _decrement() {
    setState(() {
      if (helper > 0) helper--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
            ),
            Text(
              "Need Helpers?",
              style: TextStyle(
                  color: LTheme.primaryGreen,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: _isExpanded ? 180 : 130,
                decoration: BoxDecoration(
                    color: LTheme.lightGreen,
                    borderRadius: BorderRadius.circular(10)),
                child: ListView(
                  padding: EdgeInsets.only(top: 0),
                  children: [
                    ExpansionTile(
                      title: Text(
                        'Yes',
                        style:
                            TextStyle(color: LTheme.primaryGreen, fontSize: 20),
                      ),
                      trailing: _isExpanded
                          ? Icon(Icons.remove, color: LTheme.primaryGreen)
                          : Icon(Icons.add, color: LTheme.primaryGreen),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: [
                                IconButton(
                                  onPressed: _decrement,
                                  icon: Icon(Icons.remove),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$helper',
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: _increment,
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
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
                                    "NEXT",
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
                        'No',
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
