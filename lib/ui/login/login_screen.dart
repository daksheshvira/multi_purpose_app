import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:multi_purpose_app/utils/strings.dart';
import 'package:multi_purpose_app/utils/styles.dart';
import 'package:multi_purpose_app/utils/validators.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _obscurePasswordText = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Strings.instance.login),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  Strings.instance.emailId,
                  style: Styles.instance.text16BoldWhite,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
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
                  validator: EmailFieldValidator.validate,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  Strings.instance.password,
                  style: Styles.instance.text16BoldWhite,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Builder(
                  builder: (context) => ValueListenableBuilder(
                    valueListenable: _obscurePasswordText,
                    builder: (context, value, child) => TextFormField(
                      obscureText: _obscurePasswordText.value,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        filled: true,
                        border: Styles.instance.outlineBorder,
                        focusedBorder: Styles.instance.outlineBorder,
                        enabledBorder: Styles.instance.outlineBorder,
                        fillColor: AppColors.black65,
                        errorMaxLines: 3,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePasswordText.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            _obscurePasswordText.value =
                                !_obscurePasswordText.value;
                          },
                        ),
                      ),
                      style: Styles.instance.text14White,
                      validator: PasswordFieldValidator.validate,
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      // navigate to home page
                      debugPrint('navigate to home page');
                    }
                  },
                  child: Text(
                    Strings.instance.continueText,
                    style: Styles.instance.text14White,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.success,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 16.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
