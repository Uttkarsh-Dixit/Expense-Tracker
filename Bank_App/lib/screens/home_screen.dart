import 'package:bank_app/database_services/database_services.dart';
import 'package:bank_app/db_table/transaction_table.dart';
import 'package:bank_app/screens/add_transaction_screen.dart';
import 'package:bank_app/screens/profile_screen.dart';
import 'package:bank_app/screens/stats_screen.dart';
import 'package:bank_app/screens/transactions_screen.dart';
import 'package:bank_app/widgets/transaction_card.dart';
import 'package:bank_app/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';

// Wrapper class to manage the Bottom Navigation Bar state and the overall Scaffold
class HomeScreenWrapper extends StatefulWidget {
  const HomeScreenWrapper({super.key});

  @override
  State<HomeScreenWrapper> createState() => HomeScreenWrapperState();
}

// FIX: Made State class public to be accessible by other screens for data refresh
class HomeScreenWrapperState extends State<HomeScreenWrapper> {
  int _selectedIndex = 0;
  final GlobalKey<HomeScreenState> _homeScreenKey = GlobalKey<HomeScreenState>();

  // Key to force TransactionsScreen to rebuild/reload its data
  UniqueKey _transactionsScreenKey = UniqueKey();

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _buildScreens();
  }

  void _buildScreens() {
    // We update the list every time the key changes to force a rebuild via IndexedStack
    _screens = [
      HomeScreen(key: _homeScreenKey),
      TransactionsScreen(key: _transactionsScreenKey),
      const StatsScreen(),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // FIX: Public method to trigger a full refresh across ALL screens after Add/Delete
  void reloadAllScreens() {
    // 1. Refresh Home screen data (list and balance card)
    if (_homeScreenKey.currentState != null) {
      _homeScreenKey.currentState!._reloadData();
    }

    // 2. Force TransactionsScreen and StatsScreen to rebuild/reload
    _transactionsScreenKey = UniqueKey();
    _buildScreens(); // Re-create the screen list with the new key

    // 3. Force the Wrapper to rebuild, updating IndexedStack
    setState(() {});
  }


  void _navigateToAddTransaction() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTransactionScreen()),
    );

    if (result == true) {
      // Call the public reload method
      reloadAllScreens();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F1F7),

      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddTransaction,
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
            IconButton(
              icon: Icon(Icons.home, color: _selectedIndex == 0 ? const Color(0xFF8E2DE2) : Colors.grey),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.list_alt, color: _selectedIndex == 1 ? const Color(0xFF8E2DE2) : Colors.grey),
              onPressed: () => _onItemTapped(1),
            ),
            const SizedBox(width: 48),
            IconButton(
              icon: Icon(Icons.pie_chart_outline, color: _selectedIndex == 2 ? const Color(0xFF8E2DE2) : Colors.grey),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(Icons.person_outline, color: _selectedIndex == 3 ? const Color(0xFF8E2DE2) : Colors.grey),
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}

// The actual Home Screen content
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final DatabaseService _databaseService = DatabaseService.instance;
  Future<List<Transactions>>? _recentTransactionsFuture;
  UniqueKey _transactionCardKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    _reloadData();
  }

  // FIX: Combined method to reload both list and balance card
  void _reloadData() {
    if (mounted) {
      setState(() {
        _recentTransactionsFuture = _databaseService.getTransactions();
        _transactionCardKey = UniqueKey(); // Force TransactionCard to reload totals
      });
    }
  }

  // Keep original method names for clarity and compatibility
  void _loadRecentTransactions() => _reloadData();
  void _reloadTransactionCard() => _reloadData();


  void _showNoNotifications() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No new notifications.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final transactionCard = TransactionCard(key: _transactionCardKey);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const IconButton(onPressed: null, icon: Icon(Icons.grid_view_rounded)),
                const Text('Home', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(
                    onPressed: _showNoNotifications,
                    icon: const Icon(Icons.notifications_none)
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Transaction Card
          transactionCard,

          const SizedBox(height: 30),

          // Transactions Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    final wrapper = context.findAncestorStateOfType<HomeScreenWrapperState>();
                    wrapper?._onItemTapped(1);
                  },
                  child: const Text('See All', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),

          // Recent Transactions List
          FutureBuilder<List<Transactions>>(
            future: _recentTransactionsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(),
                ));
              }

              if (snapshot.hasError) {
                return Center(child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Error loading data: ${snapshot.error}'),
                ));
              }

              final transactions = snapshot.data ?? [];
              if (transactions.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: Text('No transactions added yet.')),
                );
              }

              final recentTransactions = transactions.take(5).toList();

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recentTransactions.length,
                itemBuilder: (context, index) {
                  return TransactionTile(
                    transaction: recentTransactions[index],
                    // Use the combined reload function here
                    onTransactionDeleted: _reloadData,
                  );
                },
              );
            },
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}