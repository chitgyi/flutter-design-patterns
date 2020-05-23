// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotoAdapter extends TypeAdapter<PhotoModel> {
  @override
  final typeId = 2;

  @override
  PhotoModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhotoModel(
      title: fields[1] as String,
      id: fields[0] as int,
      thumbnailUrl: fields[3] as String,
      url: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PhotoModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.thumbnailUrl);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) {
  return PhotoModel(
    title: json['title'] as String,
    id: json['id'] as int,
    thumbnailUrl: json['thumbnailUrl'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
