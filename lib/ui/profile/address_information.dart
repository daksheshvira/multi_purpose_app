part of 'profile_screen.dart';

class _AddressInformation extends StatelessWidget {
  const _AddressInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            Strings.instance.addressInfo.toUpperCase(),
            style: Styles.instance.text14GrayLight,
          ),
          SizedBox(
            height: 8.h,
          ),
          InfoItem(
              label: Strings.instance.street,
              value: AppEnv.instance.user?.address.street ?? ''),
          InfoItem(
              label: Strings.instance.suite,
              value: AppEnv.instance.user?.address.suite ?? ''),
          InfoItem(
              label: Strings.instance.city,
              value: AppEnv.instance.user?.address.city ?? ''),
          InfoItem(
              label: Strings.instance.zipcode,
              value: AppEnv.instance.user?.address.zipcode ?? ''),
        ],
      ),
    );
  }
}
