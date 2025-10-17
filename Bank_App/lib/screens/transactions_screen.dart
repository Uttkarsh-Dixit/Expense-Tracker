import 'package:bank_app/database_services/database_services.dart';
import 'package:bank_app/db_table/transaction_table.dart';
import 'package:bank_app/screens/home_screen.dart';
import 'package:bank_app/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final DatabaseService _databaseService = DatabaseService.instance;
  Future<List<Transactions>>? _transactionsFuture;
  int? _filterStatus = null;

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  @override
  void didUpdateWidget(TransactionsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reloads when the key changes (signaling an add/delete event from wrapper)
    _loadTransactions();
  }

  void _loadTransactions() {
    // FIX 1: Ensure setState always runs if we are mounted, guaranteeing the FutureBuilder gets a new Future object.
    if (mounted) {
      setState(() {
        _transactionsFuture = _databaseService.getTransactions(filterStatus: _filterStatus);
      });
    }
  }

  String get _filterText {
    if (_filterStatus == 2) return 'Income';
    if (_filterStatus == 1) return 'Expense';
    return 'All';
  }

  void _notifyWrapperForReload() {
    final wrapper = context.findAncestorStateOfType<HomeScreenWrapperState>();
    wrapper?.reloadAllScreens();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Transactions'),
        backgroundColor: const Color(0xFFF4F1F7),
        actions: [
          PopupMenuButton<int?>(
            // Use _filterStatus as the initial value to show current selection
            initialValue: _filterStatus,
            onSelected: (int? status) {
              // Directly update status
              _filterStatus = status;

              // Call loadTransactions, which updates the Future and calls setState
              _loadTransactions();
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int?>>[
              const PopupMenuItem<int?>(
                value: null, // Critical: value must be null to represent 'All Transactions'
                child: Text('All Transactions'),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('Income Only'),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Expense Only'),
              ),
            ],
            icon: Row(
              children: [
                Text(_filterText, style: const TextStyle(fontSize: 16)),
                const Icon(Icons.filter_list),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF4F1F7),
      body: FutureBuilder<List<Transactions>>(
        future: _transactionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No transactions added yet.'));
          }

          final transactions = snapshot.data!;
          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return TransactionTile(
                transaction: transactions[index],
                onTransactionDeleted: _notifyWrapperForReload,
              );
            },
          );
        },
      ),
    );
  }
}