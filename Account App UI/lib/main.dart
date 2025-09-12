import 'package:dix_flutter_tutorials/home_screen/home_screen.dart';
import 'package:dix_flutter_tutorials/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> isSeen() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    bool? seen= prefs.getBool('seen');
    if(seen == null || seen==false){
      await prefs.setBool('seen', true);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: FutureBuilder(
          future: isSeen(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }
            else {
              if(snapshot.data==true){
                return const SplashPage();
              }
              else{
                return const HomeScreen();
              }
            }
          })
    );
  }
}



