import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_purpose_app/routes/routes.dart';
import 'package:multi_purpose_app/ui/profile/info_item.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:multi_purpose_app/utils/app_env.dart';
import 'package:multi_purpose_app/utils/images.dart';
import 'package:multi_purpose_app/utils/strings.dart';
import 'package:multi_purpose_app/utils/styles.dart';

part 'address_information.dart';
part 'basic_information.dart';
part 'profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProfileHeader(),
          _BasicInformation(),
          _AddressInformation(),
          SizedBox(
            height: 32.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextButton(
              onPressed: () {
                AppEnv.instance.user = null;
                Navigator.pushReplacementNamed(context, Routes.login);
              },
              child: Text(
                Strings.instance.logout.toUpperCase(),
                style: Styles.instance.text14GrayLight,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
