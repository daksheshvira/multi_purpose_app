import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_purpose_app/data/models/todo.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:multi_purpose_app/utils/styles.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black25,
        borderRadius: BorderRadius.circular(6.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            todo.title,
            style: Styles.instance.text24White,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            todo.completed ? 'Completed' : 'Incomplete',
            style: todo.completed
                ? Styles.instance.text14SemiBoldSuccess
                : Styles.instance.text14SemiBoldError,
          ),
        ],
      ),
    );
  }
}
