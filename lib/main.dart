import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_purpose_app/providers/album_notifier.dart';
import 'package:multi_purpose_app/providers/home_provider.dart';
import 'package:multi_purpose_app/routes/routes.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(create: (_) => AlbumNotifier()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: AppColors.black18,
            accentColor: AppColors.black25,
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            ),
            scaffoldBackgroundColor: AppColors.black18,
          ),
          onGenerateRoute: Routes.onGenerateRoute,
          initialRoute: Routes.splash,
        ),
      ),
    );
  }
}
