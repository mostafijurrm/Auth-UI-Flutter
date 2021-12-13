import 'package:flutter/material.dart';
import 'package:auth_ui/utils/custom_color.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CustomLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SleekCircularSlider(
            appearance: CircularSliderAppearance(
              size: 80,
              spinnerMode: true,
              customColors: CustomSliderColors(
                dotColor: CustomColor.primaryColor,
                progressBarColor: CustomColor.accentColor,
                trackColor: CustomColor.accentColor,
                shadowColor: Colors.black,
              )
            ),
            initialValue: 100,
            onChange: (double value) {
              // print(value);
            }),
    );
  }
}
