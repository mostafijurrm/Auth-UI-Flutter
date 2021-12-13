import 'dart:io';

import 'package:auth_ui/routes/routes.dart';
import 'package:auth_ui/utils/custom_color.dart';
import 'package:auth_ui/utils/dimensions.dart';
import 'package:auth_ui/utils/strings.dart';
import 'package:auth_ui/widgets/button/image_button_widget.dart';
import 'package:auth_ui/widgets/button/primary_button_widget.dart';
import 'package:auth_ui/widgets/custom_appbar.dart';
import 'package:auth_ui/widgets/image_upload_widget.dart';
import 'package:auth_ui/widgets/input/input_password_widget.dart';
import 'package:auth_ui/widgets/input/input_text_field_widget.dart';
import 'package:auth_ui/widgets/input/country_code_picker_widget.dart';
import 'package:auth_ui/widgets/sized_box/custom_size.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;


class RegisterScreen extends StatefulWidget {


  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final occupationController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();



  bool isChecked = false;
  String countryName = 'Bangladesh';
  String mobileCode = '';
  String countryCode = '';

  //image upload
  final picker = ImagePicker();
  File? _file;

  @override
  void dispose() {
    // TODO: implement dispose
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    usernameController.dispose();
    occupationController.dispose();
    addressController.dispose();
    cityController.dispose();
    zipCodeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // phoneController.text = '+39';
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: () => Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppbar(
          title: Strings.register,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 24.w
            ),
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                _headerWidget(context),
                _inputWidget(context),
                _checkBoxWidget(context),
                _buttonWidget(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _headerWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 52.h,),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            Text(
              Strings.alreadyHaveAnAccount,
              style: TextStyle(
                  fontSize: Dimensions.defaultTextSize.sp,
                  fontWeight: FontWeight.w400,
                  color: CustomColor.secondaryColor
              ),
            ),
            GestureDetector(
              child: Text(
                Strings.login,
                style: TextStyle(
                    fontSize: Dimensions.defaultTextSize.sp,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.accentColor
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        SizedBox(height: 24.h,),
      ],
    );
  }

  _inputWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InputTextFieldWidget(
                  controller: firstNameController,
                  hintText: Strings.firstName,
                ),
              ),
              CustomSize.widthBetween(),
              Expanded(
                child: InputTextFieldWidget(
                  controller: lastNameController,
                  hintText: Strings.lastName,
                ),
              ),
            ],
          ),
          CountryCodePickerWidget(
              onChanged: (value) {
                CountryCode cc = value;
                setState(() {
                  countryName = cc.name!;
                  countryCode = cc.code!;
                  mobileCode = cc.dialCode!;
                  phoneController.text = mobileCode;
                });
                print(mobileCode);
              },
              mobileController: phoneController
          ),
          InputTextFieldWidget(
            controller: emailController ,
            hintText: Strings.email,
            keyboardType: TextInputType.emailAddress,
          ),
          InputTextFieldWidget(
            controller: usernameController ,
            hintText: Strings.username,
          ),
          Row(
            children: [
              Expanded(
                child: InputTextFieldWidget(
                  controller: firstNameController,
                  hintText: Strings.dateOfBirth,
                ),
              ),
              CustomSize.widthBetween(),
              Expanded(
                child: InputTextFieldWidget(
                  controller: occupationController ,
                  hintText: Strings.occupation,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ImageUploadWidget(
                  child: _file != null ? Image.file(_file!, height: 12.h,) : Icon(Icons.insert_drive_file_sharp, size: 15,),
                  title: _file != null ? Strings.reUpload : Strings.uploadIDCard,
                  onTap: () {
                    _openGallery();
                  },
                ),
              ),
              CustomSize.widthBetween(),
              Expanded(
                child: InputTextFieldWidget(
                  controller: addressController ,
                  hintText: Strings.address,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: InputTextFieldWidget(
                  controller: cityController,
                  hintText: Strings.city,
                ),
              ),
              CustomSize.widthBetween(),
              Expanded(
                child: InputTextFieldWidget(
                  controller: zipCodeController ,
                  hintText: Strings.zipCode,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          InputPasswordWidget(
            controller: passwordController,
            hintText: Strings.password,
          ),
          InputPasswordWidget(
            controller: confirmPasswordController,
            hintText: Strings.confirmPassword,
          ),
        ],
      ),
    );
  }

  _checkBoxWidget(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: isChecked,
      activeColor: CustomColor.primaryColor,
      onChanged: (value) {
        setState(() {
          isChecked = value!;
        });
      },
      title: Wrap(
        alignment: WrapAlignment.start,
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
    );
  }

  _buttonWidget(BuildContext context) {
    return Column(
      children: [
        PrimaryButtonWidget(
            title: Strings.register,
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.emailVerificationScreen, arguments: emailController.text);
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
        ImageButtonWidget(
            title: Strings.google,
            imagePath: 'assets/google.png',
            onPressed: () {

            }
        ),
        SizedBox(height: 16.h,),
      ],
    );
  }

  Future<void> _openGallery() async{

    XFile? pickedFile;

    pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1920
    );

    final String fileName = path.basename(pickedFile!.path);

    print(fileName);

    setState(() {
      _file = File(pickedFile!.path);
    });

  }

}
