part of 'profile_screen.dart';

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      color: AppColors.black25,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              height: 48.r,
              width: 48.r,
              image: AssetImage(Images.instance.person),
            ),
            SizedBox(
              width: 16.w,
            ),
            Text(
              Strings.instance.userProfile,
              style: Styles.instance.text32ExtraBoldWhite,
            ),
          ],
        ),
      ),
    );
  }
}
