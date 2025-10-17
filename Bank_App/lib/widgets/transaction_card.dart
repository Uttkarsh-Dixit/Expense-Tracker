import 'package:flutter/material.dart';
import '../database_services/database_services.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatefulWidget {
  const TransactionCard({super.key});

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  final DatabaseService _databaseService = DatabaseService.instance;
  double? totalIncome, totalExpense, bal;

  @override
  void initState() {
    super.initState();
    fetchTotals();
  }

  void fetchTotals() async {
    // This is called via a new UniqueKey() on the HomeScreen wrapper to ensure fresh data
    double income = await _databaseService.getTotalIncome();
    double expense = await _databaseService.getTotalExpense();
    if (mounted) {
      setState(() {
        totalIncome = income;
        totalExpense = expense;
        bal = income - expense;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(symbol: '₹', decimalDigits: 2);
    final displayBalance = currencyFormatter.format(bal ?? 0);
    final displayIncome = currencyFormatter.format(totalIncome ?? 0);
    final displayExpense = currencyFormatter.format(totalExpense ?? 0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF5A189A),
              Color(0xFF8E2DE2),
              Color(0xFFF79421),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Total Balance Dropdown
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Total Balance',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.white70, size: 20),
                  ],
                ),
                Icon(Icons.more_horiz, color: Colors.white70),
              ],
            ),

            // Main Balance
            const SizedBox(height: 8),
            Text(
              displayBalance,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 30),

            // Income and Expenses Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Income Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.arrow_downward, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text('Income', style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      displayIncome,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),

                // Expenses Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.arrow_upward, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text('Expenses', style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      displayExpense,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}