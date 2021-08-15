import 'package:flutter/foundation.dart';
import 'package:multi_purpose_app/data/common_repo.dart';
import 'package:multi_purpose_app/data/models/comment.dart';
import 'package:multi_purpose_app/data/models/post.dart';

class HomeProvider extends ChangeNotifier {
  final repo = CommonRepo();
  List<Post> posts = [];

  Future<String> getPosts() async {
    try {
      posts = await repo.getPosts();
      notifyListeners();
      return '';
    } catch (e) {
      return e.toString();
    }
  }

  Future<List<Comment>> getComments(int id) async {
    try {
      var comments = await repo.getComments(id);
      return comments;
    } catch (e) {
      return [];
    }
  }
}
