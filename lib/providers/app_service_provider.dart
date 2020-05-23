import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_changenotifier/services/app_service.dart';
import 'package:test_changenotifier/utils/hive_helper.dart';

class AppServiceProvider extends ChangeNotifier {
  List<dynamic> data;
  HiveHelper _helper = HiveHelper();
  final Dio dio = Dio();

  Future getPosts() async {
    data = await AppService(dio).getPosts();
    notifyListeners();
  }

  Future getPhotos() async {
    try {
      data = await AppService(dio).getPhotos();
      _helper.addPhotos(data);
      data = _helper.getPhotos();
    } catch (e) {}
    notifyListeners();
  }
}
