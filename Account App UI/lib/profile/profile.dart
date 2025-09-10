import 'package:dix_flutter_tutorials/Add/addition.dart';
import 'package:dix_flutter_tutorials/profile/name.dart';
import 'package:dix_flutter_tutorials/profile/option_box.dart';
import 'package:dix_flutter_tutorials/transactions/bg.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomAppBar(
      height: 100,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.home_filled)),
          IconButton(onPressed: () async{
            await Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>Background()));
          },
              icon: Icon(Icons.compare_arrows_rounded)),
          SizedBox(width: 10),

          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              foregroundColor: Colors.white,
              iconSize: 50,
            ),
            onPressed: () async {await Navigator.push(
                context, MaterialPageRoute(builder: (context)=>Addition()));},
            icon: Icon(Icons.add),
          ),

          SizedBox(width: 10),
          IconButton(onPressed: () {}, icon: Icon(Icons.pie_chart)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person), style: IconButton.styleFrom(
              backgroundColor: Colors.blue,
              iconSize: 20
          ),
          ),
        ],
      ),
    ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:
          [Color.fromARGB(180,255, 246, 229),
            Color.fromARGB(250,248, 237, 216)])
        ),
        child:Padding(padding: EdgeInsets.all(20),
        child:  Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Name(),
            SizedBox(height: 100,),
            OptionBox(),
            Spacer(),
          ],
        ),
        ),
      ),
    );
  }
}