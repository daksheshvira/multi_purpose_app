import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:multi_purpose_app/utils/styles.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final String description;

  const PageHeader({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(right: 16.w, left: 16.w, bottom: 24.h, top: 32.h),
      color: AppColors.black25,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.instance.text24White,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              description,
              style: Styles.instance.text14White,
            ),
          ],
        ),
      ),
    );
  }
}
