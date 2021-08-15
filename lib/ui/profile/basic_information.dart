part of 'profile_screen.dart';

class _BasicInformation extends StatelessWidget {
  const _BasicInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            Strings.instance.basicInfo.toUpperCase(),
            style: Styles.instance.text14GrayLight,
          ),
          SizedBox(
            height: 8.h,
          ),
          InfoItem(
            label: Strings.instance.name,
            value: AppEnv.instance.user?.name ?? '',
          ),
          InfoItem(
              label: Strings.instance.emailAddress,
              value: AppEnv.instance.user?.email ?? ''),
          InfoItem(label: Strings.instance.password, value: 'radoa'),
          InfoItem(
              label: Strings.instance.phoneNo,
              value: AppEnv.instance.user?.phone ?? ''),
          InfoItem(
              label: Strings.instance.website,
              value: AppEnv.instance.user?.website ?? ''),
          InfoItem(
              label: Strings.instance.company,
              value: AppEnv.instance.user?.company.name ?? ''),
        ],
      ),
    );
  }
}
