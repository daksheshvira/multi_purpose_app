import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_purpose_app/providers/user_notifier.dart';
import 'package:multi_purpose_app/routes/routes.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:multi_purpose_app/utils/strings.dart';
import 'package:multi_purpose_app/utils/styles.dart';
import 'package:multi_purpose_app/utils/validators.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _obscurePasswordText = ValueNotifier(true);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                  controller: _emailController,
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
                  keyboardType: TextInputType.emailAddress,
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
                  builder: (context) => ValueListenableBuilder<bool>(
                    valueListenable: _obscurePasswordText,
                    builder: (context, value, child) => TextFormField(
                      controller: _passwordController,
                      obscureText: value,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        filled: true,
                        border: Styles.instance.outlineBorder,
                        focusedBorder: Styles.instance.outlineBorder,
                        enabledBorder: Styles.instance.outlineBorder,
                        fillColor: AppColors.black65,
                        errorMaxLines: 3,
                        suffixIcon: IconButton(
                          icon: Icon(
                            value ? Icons.visibility_off : Icons.visibility,
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
                  onPressed: () async {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      var message = await context
                          .read<UserNotifier>()
                          .validateUser(_emailController.text);
                      debugPrint('login message : ' + message);
                      if (message.isEmpty) {
                        debugPrint('navigate to home page');
                        Navigator.pushReplacementNamed(context, Routes.navbar);
                      } else {
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
                  },
                  child: Text(
                    Strings.instance.continueText,
                    style: Styles.instance.text16BoldWhite,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.success,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
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
