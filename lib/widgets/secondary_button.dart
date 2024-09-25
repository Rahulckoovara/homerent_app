import 'package:flutter/material.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/config/custom_fonts.dart';

class Secondarybutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Secondarybutton(this.onPressed, this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CustomDimens.primaryBtnRadius),
            side: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: CustomFont.fontSemiBold,
              fontSize: CustomDimens.primaryBtnText,
              color: Colors.black),
        ));
  }
}
