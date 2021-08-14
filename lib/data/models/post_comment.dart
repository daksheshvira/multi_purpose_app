import 'package:json_annotation/json_annotation.dart';

part 'post_comment.g.dart';

@JsonSerializable()
class PostComment {
  PostComment({
    required this.name,
    required this.email,
    required this.comment,
    required this.postId,
    required this.id,
  });

  String name;
  String email;
  String comment;
  String postId;
  String id;

  factory PostComment.fromJson(Map<String, dynamic> json) =>
      _$PostCommentFromJson(json);

  Map<String, dynamic> toJson() => _$PostCommentToJson(this);
}
