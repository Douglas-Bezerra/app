import 'package:sqflite/sqflite.dart';

import 'package:myapp/models/users_model.dart';

class SqfliteController {
  // -------- SINGLETON --------
  static final SqfliteController instance = SqfliteController._internal();
  SqfliteController._internal();
  factory SqfliteController() => instance;
  // ---------------------------

  late final Database _db;

  Future<void> initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = '$databasesPath/ConversorMoedas.db';

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE User (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)',
        );
      },
    );
  }

  Future<void> insertUser(UsersModel user) async {
    await _db.insert("User", {
      'email': user.email,
      'password': user.password,
    });
    printDatabase();
  }

  Future<List<UsersModel>> getUsers() async {
    List<Map<String, dynamic>> users = await _db.query('User');
    printDatabase();
    return users.map((e) => UsersModel.fromJson(e)).toList();
  }

  Future<void> deleteUser(int userId) async {
    await _db.delete('User', where: 'id = ?', whereArgs: [userId]);
    printDatabase();
  }

  Future<void> updateUser(UsersModel user) async {
    await _db.update(
      'User',
      {'email': user.email, 'password': user.password},
      where: 'id = ?',
      whereArgs: [user.id],
    );
    printDatabase();
  }

  Future<void> printDatabase() async {
    List<Map<String, dynamic>> users = await _db.query('User');

    print('--- Users ---');
    for (var user in users) {
      print(
        'ID: ${user['id']}, email: ${user['email']}, password: ${user['password']}',
      );
    }
  }
}