import 'package:dix_flutter_tutorials/Add/date_picker.dart';
import 'package:flutter/material.dart';

enum Category{
  shopping('Shopping'),
  salary('Salary');

  const Category(this.label);
  final String label;
}
enum Desc{
  shopping('Shopping'),
  food('Food'),
  subscription('Subscription'),
  salary('Salary for this month');

  const Desc(this.label);
  final String label;
}

class AddDetails extends StatefulWidget{
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  Category? selected;
  Desc? description;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white
      ),
    child:Padding(padding: EdgeInsetsGeometry.fromLTRB(12, 40, 12, 20),
    child: Column(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 450,height: 60,
          child: DropdownMenu<Category>(
            width: double.infinity,
            menuHeight: 500,
            trailingIcon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.blue,),
            hintText: 'Category',
            onSelected: (Category? choice) {
              setState(() {
                selected=choice;
              });
            },
            dropdownMenuEntries: Category.values.map((choice) {
              return DropdownMenuEntry<Category>(
                  value: choice,
                  label: choice.label);
            }).toList(),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),
            ),
          ),
        ),
        SizedBox(height: 30,),
        DropdownMenu<Desc>(
          width: double.infinity,
          trailingIcon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.blue,),
          hintText: 'Description',
          onSelected: (Desc? choice) {
            setState(() {
              description=choice;
            });
          },
          dropdownMenuEntries: Desc.values.map((choice) {
            return DropdownMenuEntry<Desc>(
                value: choice,
                label: choice.label);
          }).toList(),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
          ),
        ),
        SizedBox(height: 20,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(onPressed: (){}, style: FilledButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white
            ),
                child: Text('Income')
            ),
            SizedBox(width: 20,),
            FilledButton(onPressed: (){}, style: FilledButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white
            ),
                child: Text('Expense')
            ),
          ],
        ),
        // Spacer(),
        SizedBox(height: 30,),
        Picker(),
      ],
    ),
    ),
      );

  }
}