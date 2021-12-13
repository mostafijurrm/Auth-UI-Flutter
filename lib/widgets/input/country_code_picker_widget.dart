
import 'package:auth_ui/utils/custom_style.dart';
import 'package:auth_ui/widgets/input/input_text_field_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:auth_ui/utils/custom_color.dart';
import 'package:auth_ui/utils/dimensions.dart';
import 'package:auth_ui/utils/strings.dart';

class CountryCodePickerWidget extends StatefulWidget {
  final ValueChanged onChanged;
  final TextEditingController mobileController;

  const CountryCodePickerWidget({Key? key, required this.onChanged, required this.mobileController}) : super(key: key);


  @override
  _CountryCodePickerWidgetState createState() => _CountryCodePickerWidgetState();
}

class _CountryCodePickerWidgetState extends State<CountryCodePickerWidget> {

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: CustomColor.primaryColor.withOpacity(0.02),
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                border: Border.all(
                  color: Colors.transparent,
                )
            ),
            child: CountryCodePicker(
              dialogBackgroundColor: Colors.white,
              dialogTextStyle: CustomStyle.textStyle,
              //barrierColor: Colors.white,
              onChanged: widget.onChanged,
              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
              initialSelection: 'IT',
              favorite: ['+39','FR'],
              // optional. Shows only country name and flag
              showCountryOnly: false,
              showDropDownButton: false,
              showFlag: false,
              showFlagDialog: true,
              // optional. Shows only country name and flag when popup is closed.
              showOnlyCountryWhenClosed: true,
              // optional. aligns the flag and the Text left
              alignLeft: true,
              textStyle: CustomStyle.textStyle,
              countryFilter: [

              ],
            ),
          ),
        ),
        SizedBox(width: Dimensions.widthSize,),
        Expanded(
          child: InputTextFieldWidget(
            controller: widget.mobileController,
            keyboardType: TextInputType.number,
            hintText: Strings.phone,
          ),
        ),
      ],
    );
  }

}
