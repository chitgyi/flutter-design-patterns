import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 2, adapterName: "PhotoAdapter")
class PhotoModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String url;
  @HiveField(3)
  final String thumbnailUrl;
  PhotoModel({this.title, this.id, this.thumbnailUrl, this.url});

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}
