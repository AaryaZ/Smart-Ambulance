import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/themes/theme.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final Map<String, String> editprofiledata = {
    "Name": "Arjun Karl",
    "password": "Arjun@123",
  };
  @override
  Widget build(BuildContext context) {
    var GlobalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
              "  Edit Profile",
              style: TextStyle(
                  color: LTheme.primaryGreen,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  _buildInfoField({"Name": editprofiledata["Name"] ?? ''}),
                  const SizedBox(height: 10.0),
                  _buildInfoField(
                      {"Password": editprofiledata['password'] ?? ''}),
                  const SizedBox(height: 100.0),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Editprofile()));
                      },
                      child: Container(
                        height: 60,
                        width: GlobalWidth * 0.9,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: LTheme.primaryGreen,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          "SUBMIT",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildInfoField(Map<String, String> info) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        info.keys.first,
        style: GoogleFonts.inter(
          fontSize: 14.0,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 5.0),
      Container(
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info.values.first,
                style: GoogleFonts.inter(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
