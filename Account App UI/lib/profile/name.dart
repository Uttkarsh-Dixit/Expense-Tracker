import 'package:flutter/material.dart';

class Name extends StatelessWidget{
  const Name({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              // backgroundColor: Colors.transparent,
            ),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Username', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color.fromARGB(210,145, 145, 159)
                ),
                ),
                Text('Uttkarsh Dixit', style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                ),
                )
              ],
            ),
            Spacer(),
            Icon(Icons.edit)
          ],
        ),
      );
  }
}