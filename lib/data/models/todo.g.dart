// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDo _$ToDoFromJson(Map<String, dynamic> json) {
  return ToDo(
    status: json['status'] as String,
    name: json['name'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$ToDoToJson(ToDo instance) => <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'id': instance.id,
    };
