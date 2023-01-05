import 'package:flutter/material.dart';
import 'cupertino_material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scaffold App',
      home: MyHomePage(title: 'ScaffoldApp Home'),
    );
  }
}
