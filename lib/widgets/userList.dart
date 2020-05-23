import 'package:flutter/material.dart';
import 'package:test_changenotifier/dao/user_modal.dart';

class UserList extends StatelessWidget {
  final List<UserModal> users;
  UserList({@required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (cxt, index) => ListTile(
              title: Text(users[index].name),
              subtitle: Text(users[index].email),
            ));
  }
}
