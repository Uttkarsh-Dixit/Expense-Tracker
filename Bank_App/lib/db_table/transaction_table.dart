class Transactions {
  final int id, status;
  final double amount;
  final String category;
  final DateTime date;

  Transactions({
    required this.id,
    required this.status,
    required this.amount,
    required this.category,
    required this.date,
  });
}