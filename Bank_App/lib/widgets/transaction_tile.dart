import 'package:bank_app/database_services/database_services.dart';
import 'package:bank_app/db_table/transaction_table.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  final Transactions transaction;
  // Callback function to be executed by the parent screen (e.g., HomeScreenState)
  // after a transaction is successfully deleted.
  final VoidCallback onTransactionDeleted;

  const TransactionTile({
    super.key,
    required this.transaction,
    required this.onTransactionDeleted,
  });
  
  /// Displays a confirmation dialog and deletes the transaction if confirmed.
  Future<void> _deleteTransaction(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Do you want to permanently delete this transaction?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('No')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Yes', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await DatabaseService.instance.deleteTransaction(transaction.id);
      // Execute the callback function to tell the parent to reload its data.
      onTransactionDeleted();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Transaction deleted.'), duration: Duration(seconds: 1)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isExpense = transaction.status == 1;
    // Format amount with Indian Rupee symbol (₹)
    final amountText = NumberFormat.currency(symbol: '₹', decimalDigits: 2).format(transaction.amount);
    final dateFormatted = DateFormat('hh:mm a').format(transaction.date);

    // Wrap the ListTile in a GestureDetector to enable long-press functionality
    return GestureDetector(
      onLongPress: () => _deleteTransaction(context),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isExpense ? Colors.red.withOpacity(0.1) : Colors.green.withOpacity(0.1),
          child: Icon(
            isExpense ? Icons.arrow_upward : Icons.arrow_downward,
            color: isExpense ? Colors.red : Colors.green,
            size: 20,
          ),
        ),
        title: Text(
          transaction.category,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(dateFormatted),
        trailing: Text(
          isExpense ? '- $amountText' : '+ $amountText',
          style: TextStyle(
            color: isExpense ? Colors.red : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}