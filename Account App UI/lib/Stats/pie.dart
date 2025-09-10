import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

// Customize this widget to your needs
class CustomDonutChart extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color>? colorList;
  final String centerText;

  const CustomDonutChart({
    super.key,
    required this.dataMap,
    this.colorList,
    this.centerText = '',
  });

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      colorList: [Colors.amber.shade600,
        Colors.purpleAccent,
        Colors.redAccent,],
      chartType: ChartType.ring,        // For donut-style chart
      centerText: centerText,           // Display text in the center
      chartRadius: MediaQuery.of(context).size.width / 2.5,
      ringStrokeWidth: 24,
      animationDuration: const Duration(milliseconds: 800),
      legendOptions: const LegendOptions(showLegends: false),
      chartValuesOptions: const ChartValuesOptions(
        showChartValuesInPercentage: true,
        showChartValues: false,
      ),
    );
  }
}
