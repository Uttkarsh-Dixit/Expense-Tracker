import 'package:flutter/material.dart';

mixin Money {
  Widget income({
    required String where,
    required int amount,
}) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Color.fromARGB(150,217, 217, 217, )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10),
          Icon(Icons.arrow_downward, color: Color.fromARGB(220,0, 168, 107),),
          SizedBox(width: 10,),
          Text('₹', style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Colors.black
          ),
          ),
          Text(
            amount.toString(),
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Colors.black
            ),
          ),
          Spacer(),
          Text(
              where,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(150,118, 116, 116)
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
}

  Widget spend({
    required String where,
    required int amount,
  }) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          color: Color.fromARGB(220,217, 217, 217)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10),
          Icon(Icons.arrow_upward, color: Color.fromARGB(150,253, 60, 74),),
          SizedBox(width: 10,),
          Text('₹', style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Colors.black
          ),
          ),
          Text(
            amount.toString(),
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ),
          ),
          Spacer(),
          Text(
            where,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(150,118, 116, 116)
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class Transactions extends StatelessWidget with Money{
  const Transactions({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        income(where: 'Income', amount: 15000),
        SizedBox(height: 10,),
        spend(where: 'Food', amount: 6500),
        SizedBox(height: 10,),
        income(where: 'Income', amount: 2800),

      ],
    );
  }
}