import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/themes/theme.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(37, 228, 253, 251),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 18),
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
                "  History",
                style: TextStyle(
                    color: LTheme.primaryGreen,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                  child: Column(
                children: [
                  _buildHistoryTile("ECO to",
                      "St. Vincent's Hospital,A.J.Road Kurla", "Rs. 1989.00"),
                  SizedBox(
                    height: 10,
                  ),
                  _buildHistoryTile(
                      "ECO to", "HKJ Hospital, Wadala Road", "Rs. 1989.00"),
                  SizedBox(
                    height: 10,
                  ),
                  _buildHistoryTile("ECO to",
                      "St. Vincent's Hospital,A.J.Road Kurla", "Rs. 1989.00"),
                ],
              ))
            ],
          ),
        ));
  }
}

Widget _buildHistoryTile(String vehicle, String location, String price) {
  return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(vehicle, style: TextStyle(fontSize: 15)),
                Text(location, style: TextStyle(fontSize: 12)),
                Text(price,
                    style: TextStyle(
                        fontSize: 15,
                        color: LTheme.primaryGreen,
                        fontWeight: FontWeight.w500)),
                SizedBox(height: 20),
                Text("Jun 04, 08:30 PM",
                    style: TextStyle(fontSize: 15, color: Colors.grey)),
              ],
            ),
            Image.asset("assets/home/Eco.png")
          ],
        ),
      ));
}
