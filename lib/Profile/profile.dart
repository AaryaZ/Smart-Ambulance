import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/Profile/editprofile.dart';
import 'package:smartambulance/themes/theme.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Map<String, String> profiledata = {
    "Name": "Arjun Karl",
    "mobile": "77389456210",
    "password": "Arjun@123",
    "treq": "3"
  };
  @override
  Widget build(BuildContext context) {
    var GlobalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LTheme.sbgcolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 110,
            ),
            Text(
              "   User Profile",
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
                  _buildInfoField({"Name": profiledata["Name"] ?? ''}),
                  const SizedBox(height: 10.0),
                  _buildInfoField({"Mobile No.": profiledata['mobile'] ?? ''}),
                  const SizedBox(height: 10.0),
                  _buildInfoField({"Password": profiledata['password'] ?? ''}),
                  const SizedBox(height: 10.0),
                  _buildInfoField(
                      {"Total Number of Requests": profiledata['treq'] ?? ''}),
                  const SizedBox(height: 50.0),
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
                          "EDIT PROFILE",
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
