import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:beautyTn/base/themes/token.dart';

class TextFieldOtp extends StatelessWidget {
  final TextEditingController controller;
  final int length;
  final ValueChanged onChanged;


  const TextFieldOtp({
    super.key,
    required this.controller,
    required this.length,
    required this.onChanged
  });



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        controller: controller,
        appContext: context,
        length: length,
        obscureText: false,
        keyboardType: TextInputType.number,
        textStyle: TextStyle(color: CustomColor.primary),
        animationType: AnimationType.fade,
        cursorColor: CustomColor.primary,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(7),
          selectedColor: CustomColor.primary,
          activeColor: CustomColor.primary.withOpacity(0.4),
          inactiveColor: CustomColor.disableColor,
          fieldHeight: 52,
          fieldWidth: 50,
          activeFillColor: Colors.transparent,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
