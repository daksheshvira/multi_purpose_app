import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_purpose_app/utils/styles.dart';

class InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const InfoItem({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: Styles.instance.text14White,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Styles.instance.text14Gray,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
