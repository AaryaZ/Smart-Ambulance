import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartambulance/initialscreens/Booking/bookeddetails.dart';
import 'package:smartambulance/themes/theme.dart';

class Razorpay extends StatefulWidget {
  const Razorpay({super.key});

  @override
  State<Razorpay> createState() => _RazorpayState();
}

class _RazorpayState extends State<Razorpay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: LTheme.bgColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 18),
        child: SingleChildScrollView(
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
                "Razorpay",
                style: TextStyle(
                    color: LTheme.primaryGreen,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Container(
                  height: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Fees Breakup",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Other Charges",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            Text("Rs. 0.00",
                                style: TextStyle(
                                    color: LTheme.primaryGreen, fontSize: 16))
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Accident Insurance",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            Text("Rs. 0.00",
                                style: TextStyle(
                                    color: LTheme.primaryGreen, fontSize: 16))
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Gateway Fee",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            Text("Rs. 0.00",
                                style: TextStyle(
                                    color: LTheme.primaryGreen, fontSize: 16))
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "GST on Gateway Fee",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            Text("Rs. 0.00",
                                style: TextStyle(
                                    color: LTheme.primaryGreen, fontSize: 16))
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            Text("Rs. 1897.57",
                                style: TextStyle(
                                    color: LTheme.primaryGreen, fontSize: 16))
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Divider(
                          color: Colors.black54,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text("Rs. 1897.57",
                                style: TextStyle(
                                    color: LTheme.primaryGreen,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                        SizedBox(height: 20.0),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Bookeddetails()));
                            },
                            child: Container(
                              height: 60,
                              width: double.maxFinite,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: LTheme.primaryGreen,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                "ACCEPT",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
