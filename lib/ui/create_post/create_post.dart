import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:multi_purpose_app/utils/images.dart';
import 'package:multi_purpose_app/utils/strings.dart';
import 'package:multi_purpose_app/utils/styles.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _postController = TextEditingController();

  final ValueNotifier<bool> _hasData = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.instance.createPost,
          style: Styles.instance.text18ExtraBoldWhite,
        ),
        leading: IconButton(
          icon: SvgPicture.asset(Images.instance.back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                Strings.instance.title,
                style: Styles.instance.text16BoldWhite,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  filled: true,
                  border: Styles.instance.outlineBorder,
                  focusedBorder: Styles.instance.outlineBorder,
                  enabledBorder: Styles.instance.outlineBorder,
                  fillColor: AppColors.black65,
                  errorMaxLines: 3,
                ),
                style: Styles.instance.text14White,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                onChanged: _handleOnTextChange,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                Strings.instance.post,
                style: Styles.instance.text16BoldWhite,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                controller: _postController,
                decoration: InputDecoration(
                  filled: true,
                  border: Styles.instance.outlineBorder,
                  focusedBorder: Styles.instance.outlineBorder,
                  enabledBorder: Styles.instance.outlineBorder,
                  fillColor: AppColors.black65,
                  errorMaxLines: 3,
                ),
                style: Styles.instance.text14White,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                maxLines: 4,
                onChanged: _handleOnTextChange,
              ),
              SizedBox(
                height: 48.h,
              ),
              Builder(
                builder: (context) => ValueListenableBuilder<bool>(
                  valueListenable: _hasData,
                  builder: (context, value, child) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 62.w),
                    child: ElevatedButton(
                      onPressed: value
                          ? () {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                // navigate to home page
                                Navigator.pop(context);
                              }
                            }
                          : null,
                      child: Text(
                        Strings.instance.submitPost,
                        style: Styles.instance.text16BoldWhite,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: value ? AppColors.success : AppColors.black18,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.r),
                          side: BorderSide(
                            color:
                                value ? AppColors.success : AppColors.black65,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 16.h,
                          horizontal: 16.w,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleOnTextChange(String value) {
    if (_postController.text.isNotEmpty && _titleController.text.isNotEmpty) {
      _hasData.value = true;
    } else {
      _hasData.value = false;
    }
  }
}
