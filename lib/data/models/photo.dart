import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photos {
  Photos(
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  );

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);

  Map<String, dynamic> toJson() => _$PhotosToJson(this);
}
