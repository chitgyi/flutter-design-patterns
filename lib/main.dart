import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moor_example/screens/HomeScreen.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.redAccent),
      ),
      home: HomeScreen(),
    );
  }
}
