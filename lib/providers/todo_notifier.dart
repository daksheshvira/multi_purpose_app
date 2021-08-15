import 'package:flutter/foundation.dart';
import 'package:multi_purpose_app/data/common_repo.dart';
import 'package:multi_purpose_app/data/models/todo.dart';

class TodoNotifier extends ChangeNotifier {
  final repo = CommonRepo();
  List<Todo> todos = [];

  Future<String> getTodoList() async {
    try {
      todos = await repo.getTodoList();
      notifyListeners();
      return '';
    } catch (e) {
      return e.toString();
    }
  }
}
