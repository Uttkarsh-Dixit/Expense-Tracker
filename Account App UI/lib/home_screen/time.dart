import 'package:flutter/material.dart';

enum Record { today , week , month, year}

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  Record choice= Record.today;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(left: 5, right: 5),
        child: Row(
          children: [
            Expanded(
              child: SegmentedButton<Record>(
                style: SegmentedButton.styleFrom(

                    selectedBackgroundColor: Colors.black,
                    selectedForegroundColor: Colors.white,
                    foregroundColor: Colors.white
                ),
                segments: <ButtonSegment<Record>>[
                  ButtonSegment<Record>(
                      value: Record.today,
                      label: Text('Today')
                  ),
                  ButtonSegment<Record>(
                      value: Record.week,
                      label: Text('Week')
                  ),
                  ButtonSegment<Record>(
                      value: Record.month,
                      label: Text('Month')
                  ),
                  ButtonSegment<Record>(
                      value: Record.year,
                      label: Text('Year')
                  ),

                ],
                selected: <Record>{choice},
                onSelectionChanged: (Set<Record> newChoice) {
                  setState(() {
                    choice=newChoice.first;
                  });
                },
              ),
            )
          ],
        )
        ),

      ],
    );
  }
}