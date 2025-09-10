import 'package:dix_flutter_tutorials/transactions/drop.dart';
import 'package:dix_flutter_tutorials/transactions/money_record.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background ({super.key});

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
          Drop(),
          SizedBox(height: 20),
          Expanded(child: Money(),)

        ],

      ),),
    );
  }
}