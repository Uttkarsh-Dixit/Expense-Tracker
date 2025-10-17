import 'package:bank_app/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
// import '../database_services/database_services.dart'; // No need for this import here

// Dummy Transaction Tile for the list
class TransactionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final bool isExpense;

  const TransactionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        // Replace with actual image asset or network image
        backgroundImage: AssetImage('assets/images/placeholder.png'),
        backgroundColor: Color(0xFFF2F2F2),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Text(
        isExpense ? '-\$$amount' : '+\$$amount',
        style: TextStyle(
          color: isExpense ? Colors.red : Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fixed: Using the pale purple background from the image
    return Scaffold(
      backgroundColor: const Color(0xFFF4F1F7),
      // Added a centered FAB and BottomAppBar for the unique bottom navigation
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF8E2DE2),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: const Icon(Icons.home, color: Color(0xFF8E2DE2)), onPressed: () {}),
            IconButton(icon: const Icon(Icons.account_balance_wallet_outlined, color: Colors.grey), onPressed: () {}),
            const SizedBox(width: 48), // Spacer for the FAB
            IconButton(icon: const Icon(Icons.account_circle_outlined, color: Colors.grey), onPressed: () {}),
            IconButton(icon: const Icon(Icons.person_outline, color: Colors.grey), onPressed: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Fixed: Removed mainAxisAlignment.center to align content to the top
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.grid_view_rounded)),
                  const Text('Home', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Transaction Card
            const TransactionCard(),

            const SizedBox(height: 30),

            // Transactions Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transactions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All', style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
            ),

            // Transactions List Placeholder
            // Use ListView.builder if the list is long, wrapped in SizedBox
            // to give it a fixed height inside a SingleChildScrollView
            // For now, use a Column of Tiles:
            const TransactionTile(title: 'Money Transfer', subtitle: '12:35 PM', amount: '450.00', isExpense: true),
            const TransactionTile(title: 'Paypal', subtitle: '10:20 AM', amount: '1200.00', isExpense: false),
            const TransactionTile(title: 'Uber', subtitle: '08:40 AM', amount: '150.00', isExpense: true),
            const TransactionTile(title: 'Bata Store', subtitle: 'Yesterday', amount: '200.00', isExpense: true),
            // Add padding at the bottom to ensure the last tile is not hidden by the FAB
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}


// import 'package:bank_app/Home/transaction_card.dart';
// import 'package:flutter/material.dart';
// import '../database_services/database_services.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final DatabaseService _databaseService = DatabaseService.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 225, 212, 216),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(padding: EdgeInsets.all(15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(onPressed: (){}, icon: Icon(Icons.grid_view_rounded)),
//                   Spacer(),
//                   Text('Home'),
//                   Spacer(),
//                   IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none)),
//                 ],
//               ),
//             ),
//             SizedBox(height: 50),
//             TransactionCard()
//           ],
//         ),
//       ),
//       );
//   }
// }