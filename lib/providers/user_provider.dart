import 'package:flutter/cupertino.dart';
import 'package:test_changenotifier/dao/user_modal.dart';
import 'package:test_changenotifier/services/user_service.dart';
import 'package:test_changenotifier/utils/hive_helper.dart';

class UserProvider extends ChangeNotifier {
  List<UserModal> users;
  final HiveHelper _helper = HiveHelper();

  Future<void> getUsers() async {
    try {
      users = await UserService().getAllUser();
      await _helper.addUsers(users);
    } catch (e) {
      print(e);
    }
    users = _helper.getUsers();
    notifyListeners();
  }
}
