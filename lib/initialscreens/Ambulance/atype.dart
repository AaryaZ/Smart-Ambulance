import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartambulance/themes/theme.dart';

class Atype extends StatefulWidget {
  const Atype({super.key});

  @override
  State<Atype> createState() => _AtypeState();
}

class _AtypeState extends State<Atype> {
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
              "Ambulance Type",
              style: TextStyle(
                  color: LTheme.primaryGreen,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 290,
                decoration: BoxDecoration(
                    color: LTheme.lightGreen,
                    borderRadius: BorderRadius.circular(10)),
                child: ListView(
                  padding: EdgeInsets.only(top: 10),
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
                        'ICU Ventilator',
                        style:
                            TextStyle(color: LTheme.primaryGreen, fontSize: 20),
                      ),
                    ),
                    const Divider(
                      color: Colors.black54,
                      thickness: 1,
                    ),
                    const ListTile(
                      title: Text(
                        'Mortuary',
                        style:
                            TextStyle(color: LTheme.primaryGreen, fontSize: 20),
                      ),
                    ),
                    const Divider(
                      color: Colors.black54,
                      thickness: 1,
                    ),
                    const ListTile(
                      title: Text(
                        'Oxygen Facility',
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
