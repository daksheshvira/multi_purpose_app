import 'package:flutter/material.dart';
import 'package:multi_purpose_app/data/models/todo.dart';
import 'package:multi_purpose_app/ui/common/page_header.dart';
import 'package:multi_purpose_app/ui/todo/todo_item.dart';
import 'package:multi_purpose_app/utils/strings.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: Strings.instance.todoList,
          description: Strings.instance.loremIpsum,
        ),
        Flexible(
          child: ListView.builder(
            itemBuilder: (context, index) => TodoItem(
              toDo: ToDo(
                status: 'Completed',
                name: 'Draft Post',
                id: 'id',
              ),
            ),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
