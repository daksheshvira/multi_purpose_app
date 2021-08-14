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
          InfoItem(label: Strings.instance.name, value: 'Dakshesh Vira'),
          InfoItem(
              label: Strings.instance.emailAddress,
              value: 'dakshvira@gmail.com'),
          InfoItem(label: Strings.instance.password, value: 'Daksh@123'),
          InfoItem(label: Strings.instance.phoneNo, value: '9737227231'),
          InfoItem(label: Strings.instance.website, value: 'dakshesh.dev'),
          InfoItem(label: Strings.instance.company, value: 'Vira'),
        ],
      ),
    );
  }
}
