import 'package:dix_flutter_tutorials/Stats/options.dart';
import 'package:dix_flutter_tutorials/Stats/pie.dart';
import 'package:flutter/material.dart';
// import 'package:pie_chart/pie_chart.dart';

class Statistics extends StatelessWidget {
  const Statistics ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFcbf5d1),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async{
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)
        ),
        backgroundColor: Color(0xFFcbf5d1),
        title: Text('Transactions', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600
        ),),
      ),

      body: Padding(padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SizedBox(height: 124,),
             OutlinedButton.icon(
              onPressed: (){},
              label: Text('Month'),
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.blue,),)
              ,
            SizedBox(height: 30,),
        CustomDonutChart(
          dataMap: {
            'Gold': 6100,
            'Purple': 2400,
            'Red': 900,
          },
          colorList: [
            Colors.amber.shade600,
            Colors.purpleAccent,
            Colors.redAccent,
          ],
          centerText: '₹9400.0',
        ),
            SizedBox(height: 20,),
            Options()
            ],

        ),),
    );
  }
}