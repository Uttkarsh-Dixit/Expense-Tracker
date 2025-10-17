import 'package:bank_app/database_services/database_services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// FIX 2: Use AutomaticKeepAliveClientMixin to prevent rebuilding *too often* // but still allow programmatic refresh via didChangeDependencies.
class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> with AutomaticKeepAliveClientMixin {
  Future<Map<String, dynamic>>? _statsFuture;

  // IMPORTANT: Set keepAlive to true so the screen state is preserved in IndexedStack
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // Do NOT call _loadStats here. We call it in didChangeDependencies.
  }

  // FIX 2: This is the trigger. It runs when the screen is accessed for the first time
  // AND when the screen becomes the active view after a navigation event (like reloadAllScreens).
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadStats();
  }

  void _loadStats() {
    // Crucial: Set the new future inside setState to trigger the FutureBuilder
    if (mounted) {
      setState(() {
        _statsFuture = _fetchStats();
      });
    }
  }

  Future<Map<String, dynamic>> _fetchStats() async {
    final income = await DatabaseService.instance.getTotalIncome();
    final expense = await DatabaseService.instance.getTotalExpense();
    final allTransactions = await DatabaseService.instance.getTransactions(filterStatus: 1); // Only expenses

    final Map<String, double> expenseByCategory = {};
    for (var tx in allTransactions) {
      if (tx.status == 1) {
        expenseByCategory.update(tx.category, (value) => value + tx.amount, ifAbsent: () => tx.amount);
      }
    }

    return {
      'income': income,
      'expense': expense,
      'distribution': expenseByCategory,
    };
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required by AutomaticKeepAliveClientMixin

    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _statsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Error loading stats.'));
          }

          final stats = snapshot.data!;
          final double totalExpense = stats['expense'];
          final double totalIncome = stats['income'];
          final Map<String, double> distribution = stats['distribution'];

          if (totalExpense == 0.0) {
            return const Center(child: Text('Add some expenses to see the stats!'));
          }

          List<PieChartSectionData> sections = [];
          distribution.forEach((category, amount) {
            final percentage = (amount / totalExpense) * 100;
            sections.add(
              PieChartSectionData(
                color: Color(category.hashCode * 0xFFFFFF).withOpacity(1.0).withAlpha(0xFF),
                value: percentage,
                title: '${percentage.toStringAsFixed(1)}%',
                radius: 80,
                titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            );
          });

          final currencyFormatter = NumberFormat.currency(symbol: '₹', decimalDigits: 2);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Expense Distribution', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),

                // Pie Chart Widget
                SizedBox(
                  height: 300,
                  child: PieChart(
                    PieChartData(
                      sections: sections,
                      centerSpaceRadius: 40,
                      sectionsSpace: 2,
                      borderData: FlBorderData(show: false),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Distribution Legend (Key)
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: distribution.keys.map((category) {
                    final color = Color(category.hashCode * 0xFFFFFF).withOpacity(1.0).withAlpha(0xFF);
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(width: 10, height: 10, color: color),
                        const SizedBox(width: 4),
                        Text(category, style: const TextStyle(fontSize: 14)),
                      ],
                    );
                  }).toList(),
                ),
                const Divider(height: 40),

                // Total Income and Expense
                const Text('Summary', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),

                ListTile(
                  leading: const Icon(Icons.arrow_downward, color: Colors.green),
                  title: const Text('Total Income'),
                  trailing: Text(currencyFormatter.format(totalIncome), style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: const Icon(Icons.arrow_upward, color: Colors.red),
                  title: const Text('Total Expense'),
                  trailing: Text(currencyFormatter.format(totalExpense), style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}