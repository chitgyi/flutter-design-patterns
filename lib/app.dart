import 'package:flutter/material.dart';
import 'package:test_changenotifier/screens/Photos.dart';
import 'package:test_changenotifier/screens/Posts.dart';
import 'package:test_changenotifier/screens/Users.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Photos(),
    );
  }
}
