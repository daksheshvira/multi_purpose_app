// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostComment _$PostCommentFromJson(Map<String, dynamic> json) {
  return PostComment(
    name: json['name'] as String,
    email: json['email'] as String,
    comment: json['comment'] as String,
    postId: json['postId'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$PostCommentToJson(PostComment instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'comment': instance.comment,
      'postId': instance.postId,
      'id': instance.id,
    };
