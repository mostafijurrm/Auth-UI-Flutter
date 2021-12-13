import 'package:auth_ui/routes/routes.dart';
import 'package:auth_ui/utils/custom_color.dart';
import 'package:auth_ui/utils/dimensions.dart';
import 'package:auth_ui/utils/strings.dart';
import 'package:auth_ui/widgets/button/image_button_widget.dart';
import 'package:auth_ui/widgets/button/primary_button_widget.dart';
import 'package:auth_ui/widgets/input/input_password_widget.dart';
import 'package:auth_ui/widgets/input/input_text_field_widget.dart';
import 'package:auth_ui/widgets/sized_box/custom_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();

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
              _headerWidget(context),
              CustomSize.heightBetween(),
              _inputWidget(context),
              _buttonWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  _headerWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.login,
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
              Strings.dontHaveAnAccount,
              style: TextStyle(
                  fontSize: Dimensions.defaultTextSize.sp,
                  fontWeight: FontWeight.w400,
                  color: CustomColor.secondaryColor
              ),
            ),
            GestureDetector(
              child: Text(
                Strings.register,
                style: TextStyle(
                    fontSize: Dimensions.defaultTextSize.sp,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.accentColor
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Routes.registerScreen);
              },
            ),
          ],
        ),
      ],
    );
  }

  _inputWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          InputTextFieldWidget(
            controller: emailController,
            hintText: Strings.email,
          ),
          InputPasswordWidget(
            controller: passwordController,
            hintText: Strings.password,
          ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Column(
      children: [
        PrimaryButtonWidget(
            title: Strings.loginNow,
            onPressed: () {

            }
        ),
        CustomSize.heightBetween(),
        Row(
          children: [
            Expanded(
              child: Divider(),
            ),
            SizedBox(width: 16.w,),
            Text(
              Strings.orSignInVia,
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
        CustomSize.heightBetween(),
        ImageButtonWidget(
            title: Strings.google,
            imagePath: 'assets/google.png',
            onPressed: () {

            }
        )
      ],
    );
  }
}
