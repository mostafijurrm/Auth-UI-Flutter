import 'package:auth_ui/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const CustomAppbar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      child: AppBar(
        title: Text(
          title!,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
            fontSize: Dimensions.largeTextSize
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(90.h);
}
