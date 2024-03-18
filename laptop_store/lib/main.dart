import 'package:flutter/material.dart';
import 'package:laptop_store/addcart.dart';
import 'login.dart';
import 'data2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await creatingLaptopDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Login();
    //login page
  }
}
