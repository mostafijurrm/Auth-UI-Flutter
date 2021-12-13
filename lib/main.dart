import 'package:auth_ui/routes/routes.dart';
import 'package:auth_ui/utils/custom_color.dart';
import 'package:auth_ui/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CustomColor.primaryColor
    ));
    return ScreenUtilInit(
      builder: () => MaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: CustomColor.primaryColor,
          textTheme: GoogleFonts.josefinSansTextTheme(
            Theme.of(context).textTheme
          ),
        ),
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: Routes.splashScreen,
        routes: Routes.list,
      ),
      designSize: Size(360, 640),
    );
  }
}

