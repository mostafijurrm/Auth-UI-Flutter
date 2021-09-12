import 'package:auth_ui/utils/custom_color.dart';
import 'package:auth_ui/utils/dimensions.dart';
import 'package:auth_ui/widgets/input/input_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: () => Scaffold(
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
                  'Sign Up to Belyfted',
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
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: Dimensions.defaultTextSize.sp,
                        fontWeight: FontWeight.w400,
                        color: CustomColor.secondaryColor
                      ),
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: Dimensions.defaultTextSize.sp,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.accentColor
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h,),
                _inputTextField(hintText: 'Full Name'),
                SizedBox(height: 16.h,),
                _inputTextField(hintText: 'E-mail'),
                SizedBox(height: 16.h,),
                _inputTextField(hintText: 'Password'),
                SizedBox(height: 16.h,),
                _inputTextField(hintText: 'Confirm Password'),
                SizedBox(height: 16.h,),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {

                      },
                      child: Text(
                        'Create Account'
                      ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(CustomColor.accentColor),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(
                          vertical: 14.h
                        )
                      ),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(
                          fontSize: Dimensions.defaultTextSize.sp,
                          fontWeight: FontWeight.w700
                        )
                      )
                    ),
                  ),
                ),
                SizedBox(height: 16.h,),
                Row(
                  children: [
                    Expanded(
                      child: Divider(),
                    ),
                    SizedBox(width: 16.w,),
                    Text(
                      'or sign up via',
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
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/google.png',
                          width: 16,
                        ),
                        SizedBox(width: 14.w,),
                        Text(
                            'Google'
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                        side: MaterialStateProperty.all(BorderSide(
                          color: Colors.grey.withOpacity(0.5)
                        )),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                                vertical: 14.h
                            )
                        ),
                        textStyle: MaterialStateProperty.all(
                            TextStyle(
                                fontSize: Dimensions.defaultTextSize.sp,
                                fontWeight: FontWeight.w700
                            )
                        )
                    ),
                  ),
                ),
                SizedBox(height: 16.h,),
                Wrap(
                  children: [
                    Text(
                      'By signing up to Belyfted you agree to our ',
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize.sp,
                          fontWeight: FontWeight.w400,
                          color: CustomColor.secondaryColor
                      ),
                    ),
                    Text(
                      'terms and conditions',
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize.sp,
                          fontWeight: FontWeight.w600,
                          color: CustomColor.accentColor
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputTextField({required String hintText}) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
                color: Colors.transparent, width: 0
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0
              )
          ),
          filled: true,
          fillColor: CustomColor.primaryColor.withOpacity(0.03),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: Dimensions.defaultTextSize.sp,
              fontWeight: FontWeight.w400
          )
      ),
    );
  }
}
