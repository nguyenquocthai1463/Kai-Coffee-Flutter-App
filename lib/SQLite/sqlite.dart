import 'package:kahi_coffee/model/account.dart';
import 'package:kahi_coffee/model/personal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper() {
    // Constructor
    initDatabase();
  }

  final databaseName = 'account.db'; // Database name
  String accoutnTable =
      'CREATE TABLE account (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, phonenumber TEXT NOT NULL UNIQUE, password TEXT NOT NULL UNIQUE)';
  String personalTable =
      'CREATE TABLE personal (id INTEGER PRIMARY KEY AUTOINCREMENT, id_account INTEGER, firstname TEXT, lastname TEXT, birthdate TEXT, address TEXT, city TEXT, gender BLOB, FOREIGN KEY("id_account") REFERENCES "account"("id"))'; // Table personal
  Future<Database> initDatabase() async {
    // Initialize database
    final databasePath = await getDatabasesPath(); // Get database path
    final path = join(
        databasePath, databaseName); // Join database path with database name
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(accoutnTable); // Execute account table
      await db.execute(personalTable); // Execute personal table
    });
  }

  Future<int> signup(Account account) async {
    // Signup
    final Database db = await initDatabase();
    return db.insert('account', account.toMap());
  }

  Future<bool> login(Account account) async {
    // Login
    final Database db = await initDatabase();
    var res = await db.rawQuery(
        "SELECT * FROM account WHERE phonenumber = '${account.phonenumber}' AND password = '${account.password}'"); // Select account
    if (res.isNotEmpty) {
      // If account is not empty
      return true;
    } else {
      return false;
    }
  }

  Future<List<Account>> getAccounts() async {
    // Get accounts
    final Database db = await initDatabase();
    List<Map<String, dynamic>> maps =
        await db.query("account", where: "id > 0");
    return maps.map((e) => Account.fromMap(e)).toList();
  }

  Future<Account?> getIdAccount(String phonenumber) async {
    // Get id account
    final Database db = await initDatabase();
    var res = await db.rawQuery(
        "SELECT * FROM account WHERE phonenumber = '$phonenumber'"); // Select account
    if (res.isNotEmpty) {
      return Account(
        id: res[0]['id'] as int?,
        phonenumber: res[0]['phonenumber'] as String,
        password: res[0]['password'] as String,
      );
    }
    return null;
  }

  Future<int> insertPersonal(Personal personal) async {
    // Insert personal
    final Database db = await initDatabase();
    return db.insert('personal', personal.toMap());
  }

  Future<int> updatePersonal(Personal personal) async {
    // Update personal
    final Database db = await initDatabase();
    return db.update('personal', personal.toMap(),
        where: 'id_account = ?', whereArgs: [personal.id_account]);
  }

  Future<Personal?> getPersonal(int id_account) async {
    // Get personal
    final Database db = await initDatabase();
    var res = await db.rawQuery(
        "SELECT * FROM personal WHERE id_account = $id_account"); // Select personal
    if (res.isNotEmpty) {
      return Personal(
        id: res[0]['id'] as int?,
        id_account: res[0]['id_account'] as int?,
        firstname: res[0]['firstname'] as String,
        lastname: res[0]['lastname'] as String,
        birthdate: res[0]['birthdate'] as String,
        address: res[0]['address'] as String,
        city: res[0]['city'] as String,
        gender: res[0]['gender'] as bool,
      );
    }
    return null;
  }
}
