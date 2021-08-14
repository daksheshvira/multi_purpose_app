import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_purpose_app/data/models/album.dart';
import 'package:multi_purpose_app/routes/routes.dart';
import 'package:multi_purpose_app/ui/common/page_header.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:multi_purpose_app/utils/images.dart';
import 'package:multi_purpose_app/utils/strings.dart';
import 'package:multi_purpose_app/utils/styles.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: Strings.instance.albums,
          description: Strings.instance.loremIpsum,
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) => InkWell(
              borderRadius: BorderRadius.circular(6.r),
              onTap: () {
                // Routes.albumDetail
                Navigator.pushNamed(
                  context,
                  Routes.albumDetail,
                  arguments: Album(
                    name: 'Island in the sun',
                    id: 'id',
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.black25,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Island in the sun',
                      style: Styles.instance.text24White,
                    ),
                    SvgPicture.asset(Images.instance.forward),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
