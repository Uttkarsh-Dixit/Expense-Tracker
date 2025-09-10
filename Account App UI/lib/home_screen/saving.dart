import 'package:flutter/material.dart';



class Saving extends StatelessWidget {
  const Saving ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
          color: Color.fromARGB(255,253, 60, 74),
          borderRadius: BorderRadius.all(Radius.circular(20))

      ),
      child: Padding(padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/group.jpg',
              width: 50,
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Expenses', style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),
                ),
                Text('11200', style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.white
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
