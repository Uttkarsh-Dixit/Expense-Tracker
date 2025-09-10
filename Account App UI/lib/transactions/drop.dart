import 'package:flutter/material.dart';

enum Time{
  today('Today'),
  month('Month'),
  year('Year');

  const Time(this.label);
  final String label;
}

enum Number {
  all('All'), income('Income'), expense('Expense');

  const Number(this.label);
  final String label;
}

class Drop extends StatefulWidget {
  const Drop ({super.key});

  @override
  State<Drop> createState() => _DropState();
}

class _DropState extends State<Drop> {
  Time? timeChoice;
  Number? numberChoice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownMenu<Time>(
          width: 150,
          showTrailingIcon: false,
          leadingIcon: Icon(Icons.keyboard_arrow_down, color: Colors.blue,size: 36,),
          initialSelection: Time.month,
            onSelected: (Time? choice){
              setState(() {
                timeChoice= choice ;
              });
            },

            dropdownMenuEntries: Time.values.map((choice){
                  return DropdownMenuEntry<Time>(
                      value: choice,
                      label: choice.label,
                    style: MenuItemButton.styleFrom(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 23
                      )
                    )
                  );
            } ).toList(),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))
            )
          ),

        ),
        SizedBox(width: 20,),


        DropdownMenu<Number>(
          width: 150,
            showTrailingIcon: false,
            leadingIcon: Icon(Icons.keyboard_arrow_down, color: Colors.blue, size: 36,),
            initialSelection: Number.all,
            onSelected: (Number? choice) {
            setState(() {
              numberChoice=choice ;
            });
            },
            dropdownMenuEntries: Number.values.map((choice) {
              return DropdownMenuEntry<Number>(
                  value: choice,
                  label: choice.label,
                style: MenuItemButton.styleFrom(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 23
                  )
                )
              );
            }).toList(),
          inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))
              )
          ),
        ),
      ],
    );
  }
}