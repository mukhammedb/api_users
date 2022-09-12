import 'package:api_users/api_users.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api Users',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ApiUsers(),
    );
  }
}
