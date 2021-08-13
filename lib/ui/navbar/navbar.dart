import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:multi_purpose_app/utils/images.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Images.instance.logoWhite,
              height: 16.h,
              width: 16.w,
              color: _selectedIndex == 0 ? Colors.white : AppColors.gray147,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Images.instance.heart,
              height: 16.h,
              width: 16.w,
            ),
            label: 'Albums',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Images.instance.message,
              height: 16.h,
              width: 16.w,
            ),
            label: 'To Do List',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Images.instance.profile,
              height: 16.h,
              width: 16.w,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: AppColors.gray147,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
