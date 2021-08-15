import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_purpose_app/data/models/album.dart';
import 'package:multi_purpose_app/data/models/comment.dart';
import 'package:multi_purpose_app/data/models/photo.dart';
import 'package:multi_purpose_app/data/models/post.dart';
import 'package:multi_purpose_app/data/models/todo.dart';
import 'package:multi_purpose_app/data/models/user.dart';
import 'package:multi_purpose_app/services/http_service.dart';
import 'package:multi_purpose_app/utils/strings.dart';

class CommonRepo {
  String baseUrl = 'https://jsonplaceholder.typicode.com/';
  String posts = 'posts';
  String comments = 'comments';
  String profile = 'profile';
  String albums = 'albums';
  String todos = 'todos';
  String photos = 'photos';
  String users = 'users';

  final _httpService = HttpService();

  Future<List<Post>> getPosts() async {
    try {
      var response = await _httpService.makeGetRequest(baseUrl + posts) as List;

      return response
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList();
    } on SocketException {
      throw Exception(Strings.instance.noInternet);
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<Comment>> getComments(int id) async {
    try {
      var response = await _httpService.makeGetRequest(
          baseUrl + comments, '?postId=$id') as List;

      return response
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList();
    } on SocketException {
      throw Exception(Strings.instance.noInternet);
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<Album>> getAlbums() async {
    try {
      var response =
          await _httpService.makeGetRequest(baseUrl + albums) as List;

      return response
          .map((e) => Album.fromJson(e as Map<String, dynamic>))
          .toList();
    } on SocketException {
      throw Exception(Strings.instance.noInternet);
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<Photo>> getAlbumPhotos(int id) async {
    try {
      var response = await _httpService.makeGetRequest(
          baseUrl + photos, '?albumId=$id') as List;

      return response
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList();
    } on SocketException {
      throw Exception(Strings.instance.noInternet);
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<Todo>> getTodoList() async {
    try {
      var response = await _httpService.makeGetRequest(baseUrl + todos) as List;

      return response
          .map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList();
    } on SocketException {
      throw Exception(Strings.instance.noInternet);
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<User?> validateUser(String email) async {
    try {
      var response = await _httpService.makeGetRequest(
          baseUrl + users, '?email=$email') as List;
      if (response.isNotEmpty) {
        return User.fromJson(response[0] as Map<String, dynamic>);
      } else {
        throw Exception(Strings.instance.userNotFound);
      }
    } on SocketException {
      throw Exception(Strings.instance.noInternet);
    } catch (e) {
      rethrow;
    }
  }
}
