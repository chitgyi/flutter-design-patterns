// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<UserModal> {
  @override
  final typeId = 1;

  @override
  UserModal read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModal(
      name: fields[0] as String,
      email: fields[1] as String,
      username: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModal obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.username);
  }
}
