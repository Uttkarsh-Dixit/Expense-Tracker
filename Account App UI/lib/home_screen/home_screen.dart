import 'package:dix_flutter_tutorials/Add/addition.dart';
import 'package:dix_flutter_tutorials/Stats/stats.dart';
import 'package:dix_flutter_tutorials/home_screen/stack.dart';
import 'package:dix_flutter_tutorials/profile/profile.dart';
import 'package:dix_flutter_tutorials/transactions/bg.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0; // for nav highlight
  int pageIndex = 0;     // for pages[]

  final List<Widget> pages = [
    Stacked(),  // Home
    Profile(),  // Profile
  ];

  void itemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    switch (index) {
      case 0: // Home
        setState(() => pageIndex = 0);
        break;

      case 1: // Transactions
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Background()),
        );
        break;

      case 2: // Stats
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Statistics()),
        );
        break;

      case 3: // Profile
        setState(() => pageIndex = 1);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[pageIndex]),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Addition()),
          );
        },
        backgroundColor: Colors.blue,
        elevation: 5,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home_filled),
              color: selectedIndex == 0 ? Colors.blue : Colors.grey,
              onPressed: () => itemTapped(0),
            ),
            IconButton(
              icon: const Icon(Icons.compare_arrows_rounded),
              color: selectedIndex == 1 ? Colors.blue : Colors.grey,
              onPressed: () => itemTapped(1),
            ),
            const SizedBox(width: 40), // space for FAB notch
            IconButton(
              icon: const Icon(Icons.pie_chart),
              color: selectedIndex == 2 ? Colors.blue : Colors.grey,
              onPressed: () => itemTapped(2),
            ),
            IconButton(
              icon: const Icon(Icons.person),
              color: selectedIndex == 3 ? Colors.blue : Colors.grey,
              onPressed: () => itemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}





//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int selectedIndex = 0;
//   int pageIndex=0;
//
//   final List<Widget> pages = [
//     Stacked(),
//     Profile()
//   ];
//
//   void itemTapped(int index) {
//     setState(() {
//       selectedIndex=index;
//     });
//
//     switch(index) {
//       case 0 :
//         setState(() {
//           pageIndex=0;
//         });
//         break;
//       case 1:
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>Background()));
//         break;
//       case 2:
//       //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Addition()));
//       //   break;
//       // case 3:
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>Statistics()));
//         break;
//       case 3:
//         setState(() {
//           pageIndex=1;
//         });
//         break;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         body: SafeArea(
//           child: pages[pageIndex],),
//           floatingActionButton: FloatingActionButton(
//               onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Addition()));
//               },
//               backgroundColor: Colors.blue,
//               elevation: 5,
//               child: Icon(Icons.add),
//           ),
//           floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//           bottomNavigationBar:BottomAppBar(
//             shape: CircularNotchedRectangle(),
//             notchMargin: 7,
//             child: BottomNavigationBar(
//                 type: BottomNavigationBarType.fixed,
//                 selectedItemColor: Colors.blue,
//                 backgroundColor: Colors.white,
//                 // if(currentIndex: ==0){}
//                 currentIndex: selectedIndex,
//                 onTap: itemTapped,
//                 items: [
//                   BottomNavigationBarItem(
//                     icon: Icon(Icons.home_filled),
//                     label: 'Home',
//                   ),
//                   BottomNavigationBarItem(
//                     icon: Icon(Icons.compare_arrows_rounded),
//                     label: 'Transactions',
//                   ),
//                   // BottomNavigationBarItem(
//                   //     icon: Icon(Icons.add),
//                   //     label: 'Addition'
//                   // ),
//                   BottomNavigationBarItem(
//                     icon: Icon(Icons.pie_chart),
//                     label: 'Stats',
//                   ),
//                   BottomNavigationBarItem(
//                     icon: Icon(Icons.person),
//                     label: 'Profile',
//                   ),
//                 ]),
//           )
//
//
//     );
//   }
// }
