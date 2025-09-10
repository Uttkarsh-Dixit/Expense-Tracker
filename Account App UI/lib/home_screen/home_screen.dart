import 'package:dix_flutter_tutorials/Add/addition.dart';
import 'package:dix_flutter_tutorials/Stats/stats.dart';
import 'package:dix_flutter_tutorials/home_screen/stack.dart';
import 'package:dix_flutter_tutorials/profile/profile.dart';
import 'package:dix_flutter_tutorials/transactions/bg.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home_filled), style: IconButton.styleFrom(
              backgroundColor: Colors.blue,
              iconSize: 20
            ),),
            IconButton(
              onPressed: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>Background()));
              },
              icon: Icon(Icons.compare_arrows_rounded),
            ),
            SizedBox(width: 10),

            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.white,
                iconSize: 50,

                // shape: CircleBorder(
                //   side: BorderSide()
                // )
              ),
              onPressed: () async{ 
                await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>Addition()));
              },
              icon: Icon(Icons.add),
            ),
            SizedBox(width: 10),
            IconButton(onPressed: () async {
              await Navigator.push(context, MaterialPageRoute(builder: (context)=>Statistics()));
            }, icon: Icon(Icons.pie_chart)),
            IconButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> Profile())
                  );
                },
                icon: Icon(Icons.person)),
          ],
        ),
      ),

      body: Stacked()
    );
  }
}


