// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photos _$PhotosFromJson(Map<String, dynamic> json) {
  return Photos(
    json['albumId'] as int,
    json['id'] as int,
    json['title'] as String,
    json['url'] as String,
    json['thumbnailUrl'] as String,
  );
}

Map<String, dynamic> _$PhotosToJson(Photos instance) => <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
