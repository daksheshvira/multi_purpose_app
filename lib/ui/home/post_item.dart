import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_purpose_app/data/models/post.dart';
import 'package:multi_purpose_app/routes/routes.dart';
import 'package:multi_purpose_app/utils/strings.dart';
import 'package:multi_purpose_app/utils/styles.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: Styles.instance.text16BoldWhite,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            post.subTitle,
            style: Styles.instance.text14White,
          ),
          SizedBox(
            height: 8.h,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.viewComments,
                  arguments: post.id);
            },
            child: Text(
              Strings.instance.viewComments,
              style: Styles.instance.text14ExtraBoldWhite,
            ),
          ),
        ],
      ),
    );
  }
}
