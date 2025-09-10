import 'package:dix_flutter_tutorials/home_screen/income.dart';
import 'package:dix_flutter_tutorials/home_screen/saving.dart';
import 'package:flutter/material.dart';

class UpperStack extends StatelessWidget{
  const UpperStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 390,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 246, 229),
            Color.fromARGB(255, 248, 237, 216),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
            child:Padding(padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'MONDAY 9\nNOVEMBER',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Uttkarsh',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Divider(
            color: Colors.black,
            thickness: 3,
            indent: 7,
            endIndent: 7,
          ),
          SizedBox(height: 60,),
          Text('Account Balance', style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(200,145, 145, 159)
          ),
          ),
          SizedBox(height: 20,),
          Text('9400.00', style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 40,
              color: Colors.black
          ),
          ),

          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Income(),
              SizedBox(width: 20,),
              Saving()
            ],
          ),


        ],
      ),
    );
  }
}