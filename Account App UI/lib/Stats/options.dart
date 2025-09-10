import 'package:flutter/material.dart';

enum Record { expense, income}

class Options extends StatefulWidget {
  const Options ({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {

  Record choice= Record.expense;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SegmentedButton<Record>(
          style: SegmentedButton.styleFrom(

              selectedBackgroundColor: Colors.red,
              selectedForegroundColor: Colors.white,
              foregroundColor: Colors.grey
          ),
          segments: <ButtonSegment<Record>>[
            ButtonSegment<Record>(
                value: Record.expense,
                label: Text('Expense')
            ),
            ButtonSegment<Record>(
                value: Record.income,
                label: Text('Income')
            ),

          ],
          selected: <Record>{choice},
          onSelectionChanged: (Set<Record> newChoice) {
            setState(() {
              choice=newChoice.first;
            });
          },
        ),
      ],
    );
  }
}