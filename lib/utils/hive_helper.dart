import 'package:hive/hive.dart';
import 'package:test_changenotifier/dao/photo_model.dart';
import 'package:test_changenotifier/dao/user_modal.dart';
import 'package:test_changenotifier/dao/image_model.dart';

class HiveHelper {
  static final HiveHelper _hiveHelper = HiveHelper.internal();
  HiveHelper.internal();
  factory HiveHelper() {
    return _hiveHelper;
  }

  addUsers(List<UserModal> users) {
    var userBox = Hive.box<UserModal>("users");
    userBox
      ..deleteAll(userBox.keys)
      ..addAll(users);
  }

  getUsers() {
    var userBox = Hive.box<UserModal>("users");
    return userBox.values.toList();
  }

  getPhotos() {
    var userBox = Hive.box<PhotoModel>("photos");
    return userBox.values.toList();
  }

  ImageModel getImageByName(String value) {
    var userBox = Hive.box<ImageModel>("images");
    var img = userBox.values.where((test) => test?.url == value);

    if (img == null) {
      return null;
    } else if (img.isEmpty) {
      return null;
    } else {
      print(img.first);
      return img.first;
    }
  }

  addImage(ImageModel value) {
    var userBox = Hive.box<ImageModel>("images");
    userBox.add(value);
  }

  addPhotos(List<PhotoModel> photos) {
    var userBox = Hive.box<PhotoModel>("photos");
    userBox
      ..deleteAll(userBox.keys)
      ..addAll(photos);
  }
}
