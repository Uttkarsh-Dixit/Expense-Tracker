import 'package:flutter/material.dart';

class OptionBox extends StatelessWidget {
  const OptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Card(
            child: Center(
              child: ListTile(
                leading: Image.asset('assets/images/wallet.jpg'),
                title: Text(
                  'Account',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 100,
        child: Card(
        child: Center(
          child: ListTile(
            leading: Image.asset(
              'assets/images/settings.jpg',
            ),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
          ),
        ),),),
        SizedBox(height: 100,
        child: Card(
        child: Center(
          child: ListTile(
            leading: Image.asset(
              'assets/images/upload.jpg',
            ),
            title: Text(
              'Export Data',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
          ),
        ),),),

        SizedBox(height: 100,
        child: Card(
        child: Center(
          child: ListTile(
            leading: Image.asset(
              'assets/images/logout.jpg',
            ),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
          ),
        ),),)

      ],
    );
  }
}
