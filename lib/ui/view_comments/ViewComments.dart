import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_purpose_app/ui/view_comments/comment_item.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:multi_purpose_app/utils/images.dart';
import 'package:multi_purpose_app/utils/strings.dart';
import 'package:multi_purpose_app/utils/styles.dart';

class ViewComments extends StatefulWidget {
  final String postId;

  const ViewComments({Key? key, required this.postId}) : super(key: key);

  @override
  _ViewCommentsState createState() => _ViewCommentsState();
}

class _ViewCommentsState extends State<ViewComments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.instance.viewComments,
          style: Styles.instance.text18ExtraBoldWhite,
        ),
        leading: IconButton(
          icon: SvgPicture.asset(Images.instance.back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => CommentItem(
          name: 'Dakshesh Vira',
          email: 'dakshvira@gmail.com',
          comment: Strings.instance.loremIpsum,
        ),
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) => Container(
          margin: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Divider(
            color: AppColors.gray147,
          ),
        ),
      ),
    );
  }
}
