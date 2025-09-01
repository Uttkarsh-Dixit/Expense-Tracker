import 'package:dix_flutter_tutorials/buttons.dart';
import 'package:dix_flutter_tutorials/grid_views.dart';
import 'package:dix_flutter_tutorials/home_page.dart';
import 'package:dix_flutter_tutorials/navigate.dart';
import 'package:dix_flutter_tutorials/size.dart';
import 'package:flutter/material.dart';

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({super.key});
  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  final List<Color> colorList = [Color(0xFFced6d0), Color(0xFFbbedc9)];

  void _openButtonsPage() {
    Navigator.pop(context); // Close the drawer
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ButtonsPage(colorList: colorList)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Learn Widgets'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
        ],
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.pinkAccent),
            child: Text('Profile', style: TextStyle(color: Colors.black, fontSize: Size.width * 0.025)),
          ),
          ListTile(
            title: const Text('Home Page'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Buttons Page'),
            onTap: _openButtonsPage,
          ),
          ListTile(
            title: const Text('Grid View Page'),
            onTap: () => Navigate().onScreen(context, () => GridViews(colorList: colorList)),
          ),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 55,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.home)),
            IconButton(onPressed: (){}, icon: Icon(Icons.mail_outline)),
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
            IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
          ],
        ),
      ),
      body: HomePage(colorList: colorList),
    );
  }
}
