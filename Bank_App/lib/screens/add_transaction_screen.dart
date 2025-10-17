import 'package:bank_app/database_services/database_services.dart';
import 'package:flutter/material.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isIncome = false;

  @override
  void dispose() {
    _amountController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _saveTransaction() async {
    if (_formKey.currentState!.validate()) {
      final double amount = double.tryParse(_amountController.text) ?? 0.0;
      if (amount <= 0) return;

      await DatabaseService.instance.addTransaction(
        amount: amount,
        category: _categoryController.text,
        isIncome: _isIncome,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${_isIncome ? 'Income' : 'Expense'} added successfully!')),
      );

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Transaction'),
        backgroundColor: const Color(0xFFF4F1F7),
      ),
      backgroundColor: const Color(0xFFF4F1F7),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Toggle Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: const Text('Expense'),
                    selected: !_isIncome,
                    onSelected: (selected) {
                      setState(() {
                        _isIncome = !selected;
                      });
                    },
                    selectedColor: Colors.red[100],
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(color: !_isIncome ? Colors.red : Colors.black),
                  ),
                  const SizedBox(width: 10),
                  ChoiceChip(
                    label: const Text('Income'),
                    selected: _isIncome,
                    onSelected: (selected) {
                      setState(() {
                        _isIncome = selected;
                      });
                    },
                    selectedColor: Colors.green[100],
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(color: _isIncome ? Colors.green : Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Amount Field
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount (₹) *',
                  prefixText: '₹',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.white,
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || double.tryParse(value) == null || double.tryParse(value)! <= 0) {
                    return 'Please enter a valid amount.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Category/Description Field
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(
                  labelText: _isIncome ? 'Source (e.g., Salary, Gift)' : 'Category (e.g., Food, Travel)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.white,
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category or source.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),

              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: _saveTransaction,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color(0xFF8E2DE2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    'Save Transaction',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}