import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_purpose_app/data/models/comment.dart';
import 'package:multi_purpose_app/providers/home_provider.dart';
import 'package:multi_purpose_app/ui/view_comments/comment_item.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:multi_purpose_app/utils/images.dart';
import 'package:multi_purpose_app/utils/strings.dart';
import 'package:multi_purpose_app/utils/styles.dart';
import 'package:provider/provider.dart';

class ViewComments extends StatefulWidget {
  final int postId;

  const ViewComments({Key? key, required this.postId}) : super(key: key);

  @override
  _ViewCommentsState createState() => _ViewCommentsState();
}

class _ViewCommentsState extends State<ViewComments> {
  List<Comment> comments = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      getComments();
    });
  }

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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (context, index) => CommentItem(
                name: comments[index].name,
                email: comments[index].email,
                comment: comments[index].body,
              ),
              itemCount: comments.length,
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

  Future<void> getComments() async {
    try {
      setState(() {
        isLoading = true;
      });
      var list = await context.read<HomeProvider>().getComments(widget.postId);
      setState(() {
        comments = list;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        comments = [];
        isLoading = false;
      });
    }
  }
}
