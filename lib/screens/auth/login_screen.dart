import 'package:auth_ui/utils/custom_color.dart';
import 'package:auth_ui/utils/dimensions.dart';
import 'package:auth_ui/widgets/button/image_button_widget.dart';
import 'package:auth_ui/widgets/button/primary_button_widget.dart';
import 'package:auth_ui/widgets/input/input_password_widget.dart';
import 'package:auth_ui/widgets/input/input_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 24.w
          ),
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 52.h,),
              Text(
                'Login',
                style: TextStyle(
                    fontSize: Dimensions.largeTextSize.sp,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.primaryColor
                ),
              ),
              SizedBox(height: 4.h,),
              Wrap(
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        fontSize: Dimensions.defaultTextSize.sp,
                        fontWeight: FontWeight.w400,
                        color: CustomColor.secondaryColor
                    ),
                  ),
                  Text(
                    'Register',
                    style: TextStyle(
                        fontSize: Dimensions.defaultTextSize.sp,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.accentColor
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h,),
              InputTextFieldWidget(
                controller: emailController,
                title: '',
                hintText: 'E-mail',
              ),
              SizedBox(height: 16.h,),
              InputPasswordWidget(
                controller: passwordController,
                title: '',
                hintText: 'Password',
              ),
              SizedBox(height: 16.h,),
              PrimaryButtonWidget(
                  title: 'Create Account',
                  onPressed: () {

                  }
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  Expanded(
                    child: Divider(),
                  ),
                  SizedBox(width: 16.w,),
                  Text(
                    'or sign in via',
                    style: TextStyle(
                        fontSize: Dimensions.defaultTextSize.sp,
                        fontWeight: FontWeight.w400,
                        color: CustomColor.secondaryColor
                    ),
                  ),
                  SizedBox(width: 16.w,),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              SizedBox(height: 16.h,),
              ImageButtonWidget(
                  title: 'Google',
                  imagePath: 'assets/google.png',
                  onPressed: () {

                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
