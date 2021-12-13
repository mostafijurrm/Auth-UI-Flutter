import 'dart:async';
import 'package:auth_ui/utils/custom_color.dart';
import 'package:auth_ui/utils/dimensions.dart';
import 'package:auth_ui/utils/strings.dart';
import 'package:auth_ui/widgets/button/primary_button_widget.dart';
import 'package:auth_ui/widgets/custom_appbar.dart';
import 'package:auth_ui/widgets/sized_box/custom_size.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerificationScreen extends StatefulWidget {

  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  bool isLoading = true;
  String currentText = "";
  String arguments = "q@gmail.com";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments.toString();
    print(arguments);
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: CustomAppbar(
        title: Strings.emailVerification,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: bodyWidget(context),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Image.network(
              "https://media.giphy.com/media/077i6AULCXc0FKTj9s/giphy.gif",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          CustomSize.heightBetween(),
          Padding(
            padding: EdgeInsets.only(
              top: Dimensions.heightSize
            ),
            child: RichText(
              text: TextSpan(
                  text: Strings.enterOTPSentTo,
                  children: [
                    TextSpan(
                        text: arguments,
                        style: TextStyle(
                            color: CustomColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.largeTextSize
                        )
                    ),
                  ],
                  style: TextStyle(
                      color: CustomColor.accentColor,
                      fontSize: 15
                  )
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 30),
                child: PinCodeTextField(
                  appContext: context,
                  backgroundColor: Colors.transparent,
                  pastedTextStyle: TextStyle(
                    color: Colors.orange.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  obscureText: true,
                  obscuringCharacter: '*',
                  obscuringWidget: Icon(
                    Icons.lock,
                    size: 15,
                  ),
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "I'm from validator";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    inactiveFillColor: Colors.white,
                    inactiveColor: Colors.black54,
                    activeFillColor:
                    hasError ? Colors.grey.shade100 : Colors.white,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  boxShadows: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    print("Completed");
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              hasError ? "*Please fill up all the cells properly" : "",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: Dimensions.smallTextSize,
                  fontWeight: FontWeight.w400),
            ),
          ),
          CustomSize.heightBetween(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.didntGetOtpCode,
                style: TextStyle(
                    color: CustomColor.accentColor,
                    fontSize: Dimensions.defaultTextSize
                ),
              ),
              TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    Strings.resend.toUpperCase(),
                    style: TextStyle(
                        color: CustomColor.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.defaultTextSize),
                  ))
            ],
          ),
          CustomSize.heightBetween(),
          Padding(
            padding: EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
            ),
            child: PrimaryButtonWidget(
                title: Strings.verify,
                onPressed: () {

                }
            ),
          ),
        ],
      ),
    );
  }
}
