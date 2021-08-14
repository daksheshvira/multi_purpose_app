import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_purpose_app/utils/strings.dart';
import 'package:multi_purpose_app/utils/styles.dart';

class CommentItem extends StatelessWidget {
  final String name;
  final String email;
  final String comment;

  const CommentItem({
    Key? key,
    required this.name,
    required this.email,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Dakshesh Vira',
                style: Styles.instance.text16BoldWhite,
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Text(
                  'dakshvira@gmail.com',
                  style: Styles.instance.text14Gray,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.w,
          ),
          Text(
            Strings.instance.loremIpsum,
            style: Styles.instance.text14White,
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
