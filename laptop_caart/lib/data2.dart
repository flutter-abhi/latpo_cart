import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

List symbol = [
  "!",
  "`",
  "#",
  "%",
  "^",
  "&",
  "*",
  "(",
  ")",
  "_",
  "-",
  "+",
  "+",
  ",",
  "?",
  "/",
  ":",
  ";",
  "]",
  "[",
  "}",
  "{",
  "|"
];
List userList = [];
int userindex = -1;

TextEditingController userNameController = TextEditingController();
 TextEditingController passwordController = TextEditingController();
 TextEditingController emailController = TextEditingController();

bool displayPass = true;
bool findUser(String value) {
  for (int i = 0; i < userList.length; i++) {
    if (userList[i].userName == value) {
      userindex = i;
      return true;
    }
  }
  return false;
}

bool validUserName(String value) {
  for (int i = 0; i < symbol.length; i++) {
    if (value.contains(symbol[i])) {
      return false;
    }
  }
  return true;
}

//

//

class UserModelClass {
  int? id;
  String userName;
  String pass;
  String email;
  UserModelClass(
      {this.id,
      required this.userName,
      required this.pass,
      required this.email});
  Map<String, dynamic> userModelClassMap() {
    return {"id": id, "userName": userName, "pass": pass, "email": email};
  }
}

dynamic database;
Future<void> creatingDatabase() async {
  database = await openDatabase(
    join(await getDatabasesPath(), "usersDB.db"),
    version: 1,
    onCreate: (db, version) {
      db.execute('''CREATE TABLE userTable(
         id INT primary key,
         userName TEXT,
         pass TEXT,
         email TEXT
      )''');
    },
  );
}

Future<void> insert(UserModelClass obj) async {
  dynamic localDb = await database;
  await localDb.insert("userTable", obj.userModelClassMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<List<UserModelClass>> getData() async {
  dynamic localDb = await database;
  List<Map<String, dynamic>> data = await localDb.query("userTable");
  return List.generate(data.length, (i) {
    return UserModelClass(
        id: data[i]["id"],
        userName: data[i]["userName"],
        pass: data[i]["pass"],
        email: data[i]["email"]);
  });
}
