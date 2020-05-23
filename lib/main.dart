import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:test_changenotifier/app.dart';
import 'package:test_changenotifier/dao/image_model.dart';
import 'package:test_changenotifier/dao/user_modal.dart';
import 'package:test_changenotifier/dao/photo_model.dart';
import 'package:test_changenotifier/providers/app_service_provider.dart';
import 'package:test_changenotifier/providers/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = await getApplicationDocumentsDirectory();
  Hive
    ..init(path.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(PhotoAdapter())
    ..registerAdapter(ImageAdapter());
  await Hive.openBox<UserModal>("users");
  await Hive.openBox<PhotoModel>("photos");
  await Hive.openBox<ImageModel>("images");

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));

  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppServiceProvider(),
        )
      ],
      child: MaterialApp(
        title: "Test Provider",
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primaryColor: Colors.teal, accentColor: Colors.teal[400]),
        home: App(),
      ),
    );
  }
}
