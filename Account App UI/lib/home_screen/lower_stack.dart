import 'package:dix_flutter_tutorials/home_screen/time.dart';
import 'package:dix_flutter_tutorials/home_screen/transactions.dart';
import 'package:flutter/material.dart';

class LowerStack extends StatelessWidget {
  const LowerStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFa3b8a9),
          ),
          child: Padding(padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                SizedBox(height: 420,),
                Time(),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recent Transactions'),Text('View All')
                  ],),
                SizedBox(height: 40,),
                Transactions()
              ],
            ),)
      ),
    );
  }
}