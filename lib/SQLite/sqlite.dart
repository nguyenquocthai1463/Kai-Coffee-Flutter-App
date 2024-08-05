import 'package:kahi_coffee/model/account.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String tableAccount = 'account';
final String columnId = 'id';
final String columnPhonenumber = 'phonenumber';
final String columnPassword = 'password';

class DatabaseHelper {
  DatabaseHelper() {
    initDatabase();
  }
  late Database _database;
  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'account.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableAccount($columnId INTEGER AUTO INCREMENT PRIMARY KEY, $columnPhonenumber TEXT, $columnPassword TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertAccount(Account account) async {
    await _database.insert(
      columnPhonenumber,
      {
        'phonenumber': account.phonenumber,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Account> getAccount(String phonenumber) async {
    final List<Map<String, dynamic>> maps = await _database.query(
      tableAccount,
      columns: [columnId, columnPhonenumber, columnPassword],
      where: '$columnPhonenumber = ?',
      whereArgs: [phonenumber],
    );
    if (maps.isNotEmpty) {
      return Account(
        id: maps.first[columnId].toString(),
        phonenumber: maps.first[columnPhonenumber].toString(),
        password: maps.first[columnPassword].toString(),
      );
    } else {
      throw Exception('Account not found');
    }
  }
}
