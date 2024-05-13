import 'package:flutter/material.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';


class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
   

  const PrimaryButton(this.onPressed, this.text,
    {super.key});
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
       // minimumSize: Size(double.infinity, CustomDimens.primaryBtnH),
        shape: RoundedRectangleBorder(
          
          borderRadius: BorderRadius.circular(CustomDimens.primaryBtnRadius),
          
        ),
         backgroundColor: CustomColors.primaryColor,
        // foregroundColor: CustomColors.btnForeground,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: TextStyle(
             // fontFamily: CustomFont.fontBold,
              fontSize: CustomDimens.primaryBtnText,
              color: CustomColors.primaryBtnText),
        ),
      ),
    );
  }
}
