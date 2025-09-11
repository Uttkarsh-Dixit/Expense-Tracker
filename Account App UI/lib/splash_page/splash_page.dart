import 'package:dix_flutter_tutorials/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                'assets/images/saving.jpg',
                width: double.infinity,
                height: 500,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),

          // ,Expanded(
          //       child: Image.asset('assets/images/saving.jpg', width: 360, height: 389,) ),
          Spacer(),
          Text(
            '''Simple solution for 
your budget.''',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 15),
          Text(
            '''Counter and distribute the income
correctly...''',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 15),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              elevation: 5
            ),

            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>HomeScreen())
              );
            },
            child: Text('Continue'),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
