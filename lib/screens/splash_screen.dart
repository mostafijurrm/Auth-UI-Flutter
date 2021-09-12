import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auth_ui/routs/routes.dart';
import 'package:auth_ui/utils/custom_color.dart';
import 'package:auth_ui/widgets/custom_loading.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _navigateScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: CustomLoading(),
    );
  }

  void _navigateScreen() {
    Timer(
        Duration(
            seconds: 3
        ), () => goToScreen(context)
    );
  }

  goToScreen(BuildContext context) async {
    Navigator.of(context).pushNamedAndRemoveUntil(Routes.loginScreen, (route) => false);
  }


}