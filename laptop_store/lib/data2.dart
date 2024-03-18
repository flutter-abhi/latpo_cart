import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';

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
dynamic database2;
Future<void> creatingDatabase() async {
  database = await openDatabase(
    join(await getDatabasesPath(), "usersDB.db"),
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
        '''CREATE TABLE userTable(
      
   id INT primary key,
         userName TEXT,
         pass TEXT,
         email TEXT
      )''',
      );
    },
  );
}

Future<void> creatingLaptopDatabase() async {
  database2 = await openDatabase(
    join(await getDatabasesPath(), "usersDB14.db"),
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
        '''CREATE TABLE allLaptop(
      
      nameOflaptop TEXT  primary key  ,
      mainImage TEXT ,
      subImage1 TEXT ,
      subImage2 TEXT ,
      subImage3 TEXT ,
      specification TEXT 

      )''',
      );
      await db.execute('''  CREATE TABLE kart(

      nameOflaptop TEXT  primary key  ,
      mainImage TEXT ,
      subImage1 TEXT ,
      subImage2 TEXT ,
      subImage3 TEXT ,
      specification TEXT 

     )''');

      await db.execute('''CREATE TABLE cardDataTable(
        nameOflaptop TEXT primary key,
        offerPrice INT,
        actualPrice INT,
        quantity INT,
        imageLink TEXT

      )''');
    },
  );
}

Future<void> insert(UserModelClass obj) async {
  dynamic localDb = await database;
  await localDb.insert("userTable", obj.userModelClassMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<void> insertLaptop(LaptopData obj) async {
  dynamic localDb = await database2;
  await localDb.insert("allLaptop", obj.laptopDataMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<void> addToKart(LaptopData obj) async {
  dynamic localDb = await database2;
  await localDb.insert(
    "kart",
    obj.laptopDataMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
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

Future<List<LaptopData>> getLaptopData() async {
  dynamic localDb = await database2;
  List<Map<String, dynamic>> laptopData = await localDb.query("allLaptop");
  return List.generate(laptopData.length, (i) {
    return LaptopData(
        mainImage: laptopData[i]["mainImage"],
        subImage1: laptopData[i]["subImage1"],
        subImage2: laptopData[i]["subImage2"],
        subImage3: laptopData[i]["subImage3"],
        nameOflaptop: laptopData[i]["nameOflaptop"],
        specification: laptopData[i]["specification"]);
  });
}

Future<List<LaptopData>> getKartData() async {
  dynamic localDb = await database2;
  List<Map<String, dynamic>> data = await localDb.query("kart");
  return List.generate(data.length, (i) {
    return LaptopData(
        mainImage: data[i]["mainImage"],
        subImage1: data[i]["subImage1"],
        subImage2: data[i]["subImage2"],
        subImage3: data[i]["subImage3"],
        nameOflaptop: data[i]["nameOflaptop"],
        specification: data[i]["specification"]);
  });
}