import 'package:bank_app/db_table/transaction_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  final String _transactionTableName = 'Transactions';
  final String _transactionIdColumnName = 'ID';
  final String _transactionAmountColumnName = 'Amount';
  final String _transactionStatusColumnName = 'Status';
  final String _transactionCategoryColumnName = 'Category';
  final String _transactionDateColumnName = 'Date';

  Future<Database> get database async {
    if(_db != null) return _db!;
    _db = await _getDatabase();
    return _db!;
  }

  Future<Database> _getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "bank_db.db");
    return openDatabase(
      databasePath,
      version: 3,
      onCreate: (db, version) async {
        await _createTransactionTable(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.execute('DROP TABLE IF EXISTS $_transactionTableName');
        await _createTransactionTable(db);
      },
    );
  }

  Future<void> _createTransactionTable(Database db) async{
    await db.execute('''
    CREATE TABLE IF NOT EXISTS $_transactionTableName (
    $_transactionIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
    $_transactionAmountColumnName REAL NOT NULL,
    $_transactionCategoryColumnName TEXT NOT NULL,
    $_transactionStatusColumnName INTEGER NOT NULL,
    $_transactionDateColumnName TEXT NOT NULL
    )
  ''');
  }

  Future<void> addTransaction ({
    required double amount,
    required String category,
    required bool isIncome,
  })
  async {
    if(amount <= 0 || category.isEmpty ) return ;

    final db= await database;
    final String dateString = DateTime.now().toIso8601String();

    await db.insert(_transactionTableName, {
      _transactionAmountColumnName : amount,
      _transactionCategoryColumnName : category,
      _transactionStatusColumnName : isIncome ? 2 : 1,
      _transactionDateColumnName : dateString,
    });
  }

  Future<List<Transactions>> getTransactions({int? filterStatus}) async {
    final db= await database;
    String? whereClause;
    List<Object?>? whereArgs;

    if (filterStatus != null) {
      whereClause = '$_transactionStatusColumnName = ?';
      whereArgs = [filterStatus];
    }

    final data = await db.query(
        _transactionTableName,
        where: whereClause,
        whereArgs: whereArgs,
        orderBy: '$_transactionDateColumnName DESC'
    );

    return data.map((e) => Transactions(
      id: e[_transactionIdColumnName] as int,
      status: e[_transactionStatusColumnName] as int,
      amount: e[_transactionAmountColumnName] as double,
      category: e[_transactionCategoryColumnName] as String,
      date: DateTime.parse(e[_transactionDateColumnName] as String),
    )).toList();
  }

  Future<void> deleteTransaction(int id) async {
    final db = await database;
    await db.delete(_transactionTableName,
        where: '$_transactionIdColumnName = ?',
        whereArgs: [id]);
  }

  Future<double> getTotalIncome() async {
    final db = await DatabaseService.instance.database;
    final result = await db.rawQuery(
        'SELECT SUM(amount) as total FROM $_transactionTableName WHERE $_transactionStatusColumnName = 2'
    );
    double totalIncome = result.first['total'] == null
        ? 0.0
        : (result.first['total'] as num).toDouble();
    return totalIncome;
  }

  Future<double> getTotalExpense() async {
    final db = await DatabaseService.instance.database;
    final result = await db.rawQuery(
        'SELECT SUM(amount) as total FROM $_transactionTableName WHERE $_transactionStatusColumnName = 1'
    );
    double totalExpense = result.first['total'] == null
        ? 0.0
        : (result.first['total'] as num).toDouble();
    return totalExpense;
  }

  Future<void> wipeDatabase() async {
    final db = await database;
    await db.delete(_transactionTableName);
  }
}