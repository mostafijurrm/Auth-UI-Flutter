import 'package:auth_ui/utils/custom_color.dart';
import 'package:auth_ui/utils/custom_style.dart';
import 'package:auth_ui/utils/dimensions.dart';
import 'package:auth_ui/utils/strings.dart';
import 'package:auth_ui/widgets/sized_box/custom_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputPasswordWidget extends StatefulWidget {

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;

  const InputPasswordWidget({Key? key, required this.controller, required this.hintText, this.keyboardType}) : super(key: key);

  @override
  _InputPasswordWidgetState createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {

  bool isVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          readOnly: false,
          style: CustomStyle.textStyle,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
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
            hintText: widget.hintText,
            hintStyle: CustomStyle.hintTextStyle,
            suffixIcon: IconButton(
              icon: Icon(
                isVisibility ? Icons.visibility_off : Icons.visibility,
              ),
              color: CustomColor.primaryColor,
              onPressed: () {
                setState(() {
                  isVisibility = !isVisibility;
                });
              },
            ),
          ),
          obscureText: isVisibility,
        ),
        CustomSize.heightBetween(),
      ],
    );
  }
}
