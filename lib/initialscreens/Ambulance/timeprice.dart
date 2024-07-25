import 'package:flutter/material.dart';
import 'package:smartambulance/initialscreens/Booking/nearestambulance.dart';
import 'package:smartambulance/themes/theme.dart';

class TimePrice extends StatefulWidget {
  const TimePrice({super.key});

  @override
  State<TimePrice> createState() => _TimePriceState();
}

class _TimePriceState extends State<TimePrice> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Expanded(child: CostList(onItemSelected: () {
              Future.delayed(Duration(seconds: 5), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => NearestAmbulance()),
                );
              });
            })),
          ],
        ),
      ),
    );
  }
}

class CostList extends StatefulWidget {
  final VoidCallback onItemSelected;
  CostList({required this.onItemSelected});
  @override
  State<CostList> createState() => _CostListState();
}

class _CostListState extends State<CostList> {
  int _selectedValue = -1;

  final List<Map<String, String>> items = [
    {
      "title": "Total Cost",
      "cost": "Rs. 500.00",
      "rate": "Rs. 500/Km",
      "time": "For 5 Mins"
    },
    {
      "title": "Total Cost",
      "cost": "Rs. 500.00",
      "rate": "Rs. 500/Km",
      "time": "For 5 Mins"
    },
    {
      "title": "Total Cost",
      "cost": "Rs. 500.00",
      "rate": "Rs. 500/Km",
      "time": "For 5 Mins"
    },
    {
      "title": "Total Cost",
      "cost": "Rs. 500.00",
      "rate": "Rs. 500/Km",
      "time": "For 5 Mins"
    },
    {
      "title": "Total Cost",
      "cost": "Rs. 500.00",
      "rate": "Rs. 500/Km",
      "time": "For 5 Mins"
    },
    {
      "title": "Total Cost",
      "cost": "Rs. 500.00",
      "rate": "Rs. 500/Km",
      "time": "For 5 Mins"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 600,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return CostItem(
              index: index,
              title: items[index]['title']!,
              cost: items[index]['cost']!,
              rate: items[index]['rate']!,
              time: items[index]['time']!,
              selectedValue: _selectedValue,
              onChanged: (int? value) {
                setState(() {
                  _selectedValue = value!;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Searching for the Nearest Ambulance')),
                );
                widget.onItemSelected();
              },
            );
          },
        ),
      ),
    );
  }
}

class CostItem extends StatelessWidget {
  final int index;
  final String title;
  final String cost;
  final String rate;
  final String time;
  final int selectedValue;
  final ValueChanged<int?> onChanged;

  CostItem({
    required this.index,
    required this.title,
    required this.cost,
    required this.rate,
    required this.time,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Radio<int>(
              value: index,
              groupValue: selectedValue,
              onChanged: onChanged,
              activeColor: LTheme.primaryGreen,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: LTheme.primaryGreen,
                    ),
                  ),
                  Text(
                    rate,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    time,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Text(
              cost,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: LTheme.primaryGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
