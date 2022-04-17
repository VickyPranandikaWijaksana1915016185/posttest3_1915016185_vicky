import 'package:flutter/material.dart';
import 'package:postest3_1915016185_vicky/Stateful.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stateful(),
      ),
    );
  }
}
