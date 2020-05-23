// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageAdapter extends TypeAdapter<ImageModel> {
  @override
  final typeId = 3;

  @override
  ImageModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageModel(
      url: fields[0] as String,
      src: fields[1] as Uint8List,
    );
  }

  @override
  void write(BinaryWriter writer, ImageModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.src);
  }
}
