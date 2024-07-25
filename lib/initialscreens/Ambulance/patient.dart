import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/themes/theme.dart';

class Patient extends StatefulWidget {
  const Patient({super.key});

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  final Map<String, String> patientdata = {
    "Name": "Arjun Karl",
    "mobile": "77389456210",
    "altmobile": "9234567890",
    "hname": "St. Vincent's Hospital",
    "hlocation": "St. Vincent's Hospital,A.J Road,Kurla",
    "PName": "Rohit Sanon",
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
              height: 110,
            ),
            Text(
              "Patient Details",
              style: TextStyle(
                  color: LTheme.primaryGreen,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  _buildInfoField({"Name": patientdata["Name"] ?? ''}),
                  const SizedBox(height: 10.0),
                  _buildInfoField({"Mobile No.": patientdata['mobile'] ?? ''}),
                  const SizedBox(height: 10.0),
                  _buildInfoField(
                      {"Alternate Mobile No.": patientdata['altmobile'] ?? ''}),
                  const SizedBox(height: 10.0),
                  _buildInfoField(
                      {"Hospital Name": patientdata['hname'] ?? ''}),
                  const SizedBox(height: 10.0),
                  _buildInfoField(
                      {"Hospital Location": patientdata['hlocation'] ?? ''}),
                  const SizedBox(height: 10.0),
                  _buildInfoField(
                      {"Name of the Patient": patientdata['PName'] ?? ''}),
                  const SizedBox(height: 30.0),
                  GestureDetector(
                      onTap: () {
                        // _controller.nextPage(
                        //     duration: Duration(milliseconds: 500),
                        //     curve: Curves.easeInOutCirc);
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
                          "NEXT",
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
