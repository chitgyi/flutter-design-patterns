import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_changenotifier/dao/user_modal.dart';
import 'package:test_changenotifier/providers/user_provider.dart';
import 'package:test_changenotifier/utils/app_constants.dart';
import 'package:test_changenotifier/widgets/userList.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UserProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(USERS),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await usersProvider.getUsers();
          },
          child: _buildUI(usersProvider.users),
        ));
  }

  Widget _buildUI(List<UserModal> users) {
    if (users == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (users.isEmpty) {
      return Center(
        child: Text("Empty Data"),
      );
    } else {
      return UserList(
        users: users,
      );
    }
  }
}
