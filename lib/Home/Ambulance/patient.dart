import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/themes/theme.dart';

class Patient extends StatefulWidget {
  final VoidCallback onNextPage;
  final VoidCallback onPrevPage;

  Patient({required this.onNextPage, required this.onPrevPage});

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _mobilecontroller = TextEditingController();
  TextEditingController _altmobilecontroller = TextEditingController();
  TextEditingController _hnamecontroller = TextEditingController();
  TextEditingController _hlocationcontroller = TextEditingController();
  TextEditingController _patientnamecontroller = TextEditingController();

  final Map<String, String> patientdata = {
    "Name": "Arjun Karl",
    "mobile": "77389456210",
    "altmobile": "9234567890",
    "hname": "St. Vincent's Hospital",
    "hlocation": "St. Vincent's Hospital,A.J Road,Kurla",
    "PName": "Rohit Sanon",
  };

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
          onTap: () => widget.onPrevPage(),
          child: const Icon(
            Icons.arrow_back_rounded,
            color: LTheme.primaryGreen,
          ),
        ),
        title: Text(
          " Patient Details",
          style: GoogleFonts.inter(
              color: LTheme.primaryGreen,
              fontSize: getResponsiveFontSize(25),
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 18),
        child: Container(
          height: GlobalHeight * 0.9,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: GoogleFonts.inter(
                            fontSize: getResponsiveFontSize(14),
                            color: Colors.grey,
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _namecontroller,
                          showCursor: true,
                          decoration: InputDecoration(
                              hintText: "Enter Name",
                              hintStyle: GoogleFonts.inter(
                                  color: Colors.grey, fontSize: 12),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onChanged: (value) {
                            patientdata['Name'] = value;
                          },
                          validator: (String? value) {
                            return value!.isEmpty ? "*Name required" : null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "Mobile Number",
                          style: GoogleFonts.inter(
                            fontSize: getResponsiveFontSize(14),
                            color: Colors.grey,
                          ),
                        ),
                        // const SizedBox(height: 5.0),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _mobilecontroller,
                          showCursor: true,
                          decoration: InputDecoration(
                              hintText: "Enter Mobile Number",
                              hintStyle: GoogleFonts.inter(
                                  color: Colors.grey, fontSize: 12),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onChanged: (value) {
                            patientdata['mobile'] = value;
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return '*Mobile Number Required';
                            }

                            String pattern = r'^(?:[+0]9)?[0-9]{10}$';
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(value)) {
                              return '*Enter a valid mobile number';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "Alternate Mobile Number",
                          style: GoogleFonts.inter(
                            fontSize: getResponsiveFontSize(14),
                            color: Colors.grey,
                          ),
                        ),
                        // const SizedBox(height: 5.0),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _altmobilecontroller,
                          showCursor: true,
                          decoration: InputDecoration(
                              hintText: "Enter Mobile Number",
                              hintStyle: GoogleFonts.inter(
                                  color: Colors.grey, fontSize: 12),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onChanged: (value) {
                            patientdata['Name'] = value;
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            String pattern = r'^(?:[+0]9)?[0-9]{10}$';
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(value!)) {
                              return '*Enter a valid mobile number';
                            }
                          },
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "Hospital Name",
                          style: GoogleFonts.inter(
                            fontSize: getResponsiveFontSize(14),
                            color: Colors.grey,
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _hnamecontroller,
                          showCursor: true,
                          decoration: InputDecoration(
                              hintText: "Enter Hospital Name",
                              hintStyle: GoogleFonts.inter(
                                  color: Colors.grey, fontSize: 12),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onChanged: (value) {
                            patientdata['Name'] = value;
                          },
                          validator: (String? value) {
                            return value!.isEmpty
                                ? "*Hospital Name required"
                                : null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "Hospital Location",
                          style: GoogleFonts.inter(
                            fontSize: getResponsiveFontSize(14),
                            color: Colors.grey,
                          ),
                        ),
                        // const SizedBox(height: 5.0),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _hlocationcontroller,
                          showCursor: true,
                          decoration: InputDecoration(
                              hintText: "Enter Hospital Location",
                              hintStyle: GoogleFonts.inter(
                                  color: Colors.grey, fontSize: 12),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onChanged: (value) {
                            patientdata['Name'] = value;
                          },
                          validator: (String? value) {
                            return value!.isEmpty
                                ? "*Hospital Location required"
                                : null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "Patient Name",
                          style: GoogleFonts.inter(
                            fontSize: getResponsiveFontSize(14),
                            color: Colors.grey,
                          ),
                        ),
                        // const SizedBox(height: 5.0),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _patientnamecontroller,
                          showCursor: true,
                          decoration: InputDecoration(
                              hintText: "Enter Patient Name",
                              hintStyle: GoogleFonts.inter(
                                  color: Colors.grey, fontSize: 12),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onChanged: (value) {
                            patientdata['Name'] = value;
                          },
                          validator: (String? value) {
                            return value!.isEmpty
                                ? "*Patient Name required"
                                : null;
                          },
                        ),

                        const SizedBox(height: 30.0),
                        GestureDetector(
                            onTap: () {
                              if (_formkey.currentState != null &&
                                  _formkey.currentState!.validate()) {
                                widget.onNextPage();
                              }
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
