import 'package:auth_ui/utils/custom_color.dart';
import 'package:auth_ui/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextFieldWidget extends StatelessWidget {

  final String hintText;

  const InputTextFieldWidget({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScreenUtilInit(
        builder: () => TextField(
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
              fillColor: CustomColor.primaryColor.withOpacity(0.1),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: Dimensions.defaultTextSize.sp,
                  fontWeight: FontWeight.w400
              )
          ),
        ),
        designSize: Size(360, 640),
      ),
    );
  }
}
