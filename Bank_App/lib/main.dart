import 'package:bank_app/screens/home_screen.dart';
// import 'package:bank_app/screens/profile_setup_screen.dart';
import 'package:bank_app/screens/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MyAppState extends State<MyApp> {

  Future<bool> isProfileSetup() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    bool? seen = prefs.getBool('onboarding_seen');
    String? name = prefs.getString('profile_name');

    if(seen == true && name == null) {
      return false;
    }
    if(seen == true && name != null) {
      return true;
    }
    await prefs.setBool('onboarding_seen', true);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: isProfileSetup(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if(snapshot.data == true) {
            return const HomeScreenWrapper();
          } else {
            return const SplashPage();
          }
        },
      ),
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp ({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

