import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_purpose_app/routes/routes.dart';
import 'package:multi_purpose_app/ui/albums/albums_screen.dart';
import 'package:multi_purpose_app/ui/home/home_screen.dart';
import 'package:multi_purpose_app/ui/profile/profile_screen.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:multi_purpose_app/utils/images.dart';
import 'package:multi_purpose_app/utils/strings.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    AlbumsScreen(),
    Container(),
    ProfileScreen(),
  ];

  int _selectedIndex = 0;

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
            label: Strings.instance.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Images.instance.heart,
              height: 16.h,
              width: 16.w,
              color: _selectedIndex == 1 ? Colors.white : AppColors.gray147,
            ),
            label: Strings.instance.albums,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Images.instance.message,
              height: 16.h,
              width: 16.w,
              color: _selectedIndex == 2 ? Colors.white : AppColors.gray147,
            ),
            label: Strings.instance.todoList,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Images.instance.profile,
              height: 16.h,
              width: 16.w,
              color: _selectedIndex == 3 ? Colors.white : AppColors.gray147,
            ),
            label: Strings.instance.profile,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: AppColors.gray147,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: _selectedIndex == 0 ? fab() : null,
    );
  }

  Widget fab() {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, Routes.createPost),
      child: Icon(Icons.add),
      backgroundColor: AppColors.success,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
