import 'package:flutter/material.dart';

class Picker extends StatefulWidget {
  const Picker({super.key});

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100)
    );
    if(picked!=null && picked != _selectedDate) {
        setState(() {
          _selectedDate=picked;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Padding(padding: EdgeInsets.all(10),
        child: OutlinedButton(
            onPressed: (){_pickDate(context);},
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              fixedSize: Size(450, 50)
            )
            ,child: Text('Pick your Date', style: TextStyle(
          color: Color.fromARGB(250,145, 145, 159),
          fontSize: 18,
          fontWeight: FontWeight.w500
        ),
        ),
        ),
        ),
      );
  }
}