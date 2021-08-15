import 'package:flutter/material.dart';
import 'package:multi_purpose_app/providers/todo_notifier.dart';
import 'package:multi_purpose_app/ui/common/page_header.dart';
import 'package:multi_purpose_app/ui/todo/todo_item.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:multi_purpose_app/utils/strings.dart';
import 'package:multi_purpose_app/utils/styles.dart';
import 'package:provider/provider.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      getTodoList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: Strings.instance.todoList,
          description: Strings.instance.loremIpsum,
        ),
        Consumer<TodoNotifier>(
          builder: (context, value, child) {
            return isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Flexible(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        var todo = value.todos[index];
                        return TodoItem(
                          todo: todo,
                        );
                      },
                      itemCount: value.todos.length,
                    ),
                  );
          },
        ),
      ],
    );
  }

  Future<void> getTodoList() async {
    setState(() {
      isLoading = true;
    });
    var message = await context.read<TodoNotifier>().getTodoList();
    setState(() {
      isLoading = false;
    });
    if (message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: Styles.instance.text14White,
          ),
          backgroundColor: AppColors.black65,
        ),
      );
    }
  }
}
