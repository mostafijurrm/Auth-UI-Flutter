import 'package:auth_ui/utils/custom_color.dart';
import 'package:auth_ui/utils/custom_style.dart';
import 'package:auth_ui/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageUploadWidget extends StatelessWidget {

  final Widget child;
  final String title;
  final GestureTapCallback onTap;

  const ImageUploadWidget({Key? key, required this.child, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
            color: CustomColor.primaryColor.withOpacity(0.02),
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            border: Border.all(
              color: Colors.transparent,
            )
        ),
        child: Row(
          children: [
            Text(
                title,
              style: CustomStyle.textStyle,
            ),
            SizedBox(width: Dimensions.widthSize),
            child
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
