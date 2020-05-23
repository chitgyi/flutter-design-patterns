import 'package:hive/hive.dart';
part 'user_modal.g.dart';

@HiveType(typeId: 1, adapterName: "UserAdapter")
class UserModal {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String username;
  UserModal({this.name, this.email, this.username});

  UserModal.fromMap(Map<String, dynamic> jsonData)
      : name = jsonData['name'],
        email = jsonData['email'],
        username = jsonData['username'];

  Map<String, dynamic> toMap() {
    return {"name": name, "email": email, "username": username};
  }
}
