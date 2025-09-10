import 'package:dix_flutter_tutorials/Add/add_detail.dart';
import 'package:flutter/material.dart';

class Addition extends StatelessWidget {
  const Addition ({super.key});

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
        title: Text('Add a Transaction', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600
        ),),
      ),

      body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text('How Much?', style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color.fromARGB(150,10, 0, 0),
            ),),
            SizedBox(height: 10,),
            Text('₹55698', style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 45,
              color: Color.fromARGB(200,15, 0, 0),
            ),),
            SizedBox(height: 50,),
            AddDetails(),
            Spacer(),

            SizedBox(height: 60,
            child: FilledButton(onPressed: (){},
                style: FilledButton.styleFrom(
                    backgroundColor: Color.fromARGB(200,127, 61, 255),
                ),
                child: Center(child: Text('Continue', style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),),)
            ),),
            SizedBox(height:50),

          ],

        ),);
  }
}
// Padding(padding: EdgeInsets.all(25),
//         child: