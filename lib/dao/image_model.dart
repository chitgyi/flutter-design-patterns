import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'image_model.g.dart';

@HiveType(typeId: 3, adapterName: "ImageAdapter")
class ImageModel {
  @HiveField(0)
  final String url;
  @HiveField(1)
  final Uint8List src;
  ImageModel({this.url, this.src});
}
