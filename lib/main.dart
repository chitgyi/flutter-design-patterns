import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_3d/screens/home_screen.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
