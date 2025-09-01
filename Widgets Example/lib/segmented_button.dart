import 'package:flutter/material.dart';

class Segmented extends StatefulWidget {
  const Segmented({super.key, required this.colorList});

  final List<Color> colorList;

  @override
  State<Segmented> createState() {
    return _SegmentedState();
  }
}

enum Calendar { days, weeks, months, years }

class _SegmentedState extends State<Segmented> {
  Calendar choice = Calendar.days;
  @override
  Widget build(BuildContext context) {
    List<Color> colorList = widget.colorList;

    return Scaffold(
      appBar: AppBar(title: Text('Segmented Buttons')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: LinearGradient(colors: colorList)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text('Single Choice'),
            SizedBox(height: 20),
            SegmentedButton<Calendar>(
              segments: <ButtonSegment<Calendar>>[
                ButtonSegment<Calendar>(
                  value: Calendar.days,
                  label: Text("Days"),
                  icon: Icon(Icons.view_day_sharp),
                ),
                ButtonSegment<Calendar>(
                  value: Calendar.weeks,
                  label: Text("Weeks"),
                  icon: Icon(Icons.calendar_view_week_sharp),
                ),
                ButtonSegment<Calendar>(
                  value: Calendar.years,
                  label: Text("Years"),
                  icon: Icon(Icons.calendar_today),
                ),
              ],
              selected: <Calendar>{choice},
              onSelectionChanged: (Set<Calendar> newChoice) {
                setState(() {
                  choice = newChoice.first;
                });
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
