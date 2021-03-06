import 'package:auth_ui/utils/custom_color.dart';
import 'package:auth_ui/utils/custom_style.dart';
import 'package:auth_ui/utils/dimensions.dart';
import 'package:auth_ui/utils/strings.dart';
import 'package:auth_ui/widgets/sized_box/custom_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextFieldWidget extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? readOnly;

  const InputTextFieldWidget({Key? key, required this.controller, required this.hintText, this.keyboardType, this.readOnly = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          readOnly: readOnly!,
          style: CustomStyle.textStyle,
          controller: controller,
          keyboardType: keyboardType,
          validator: (String? value){
            if(value!.isEmpty){
              return Strings.pleaseFillOutTheField;
            }else{
              return null;
            }
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: BorderSide(
                    color: Colors.transparent, width: 0
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: BorderSide(color: CustomColor.primaryColor, width: 0.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: BorderSide(color: Colors.red, width: 0.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: BorderSide(color: Colors.red, width: 0.5),
              ),
              filled: true,
              fillColor: CustomColor.primaryColor.withOpacity(0.03),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              hintText: hintText,
              hintStyle: CustomStyle.hintTextStyle
          ),
        ),
        CustomSize.heightBetween()
      ],
    );
  }
}
