import 'dart:convert';

import 'package:test_changenotifier/dao/user_modal.dart';
import 'package:http/http.dart' as http;
import 'package:test_changenotifier/utils/app_constants.dart';

class UserService {
  static final UserService _userService = UserService._internal();
  UserService._internal();
  factory UserService() {
    return _userService;
  }

  Future<List<UserModal>> getAllUser() async {
    try {
      var res = await http.get(BASE_URL + "/users");
      if (res.statusCode == 200) {
        var userList = jsonDecode(res.body) as List;
        var users = userList.map((user) => UserModal.fromMap(user)).toList();
        return users;
      }
      return [];
    } catch (e) {
      throw Exception("Unable to fetch!");
    }
  }
}
