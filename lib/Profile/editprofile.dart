import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/Home/navbar.dart';
import 'package:smartambulance/themes/theme.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  TextEditingController nameController =
      TextEditingController(text: "Arjun Karl");
  TextEditingController passwordController = TextEditingController();
  final Map<String, String> editprofiledata = {
    "Name": "Arjun Karl",
    "password": "Arjun@123",
  };
  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  double getResponsiveFontSize(double baseSize) {
    return MediaQuery.of(context).size.width / 375 * baseSize;
  }

  @override
  Widget build(BuildContext context) {
    var GlobalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LTheme.sbgcolor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_rounded,
            color: LTheme.primaryGreen,
          ),
        ),
        title: Text(
          "  Edit Profile",
          style: TextStyle(
              color: LTheme.primaryGreen,
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: LTheme.sbgcolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                "Name",
                style: GoogleFonts.inter(
                  fontSize: getResponsiveFontSize(14),
                  color: Colors.grey,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                // controller: _namecontroller,
                showCursor: true,
                decoration: InputDecoration(
                    hintText: "Enter Name",
                    hintStyle:
                        GoogleFonts.inter(color: Colors.grey, fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                onChanged: (value) {},
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
                // controller: _mobilecontroller,
                showCursor: true,
                decoration: InputDecoration(
                    hintText: "Enter Mobile Number",
                    hintStyle:
                        GoogleFonts.inter(color: Colors.grey, fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                onChanged: (value) {
                  ;
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

              const SizedBox(height: 50.0),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Changes Saved Successfully.')),
                  );
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => BottomNav()));
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
                ),
              ),
            ],
          ),
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
