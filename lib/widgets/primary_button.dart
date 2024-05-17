import 'package:flutter/material.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/config/custom_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  

  const PrimaryButton(
    this.onPressed,
    this.text, {
     // Initial value set to true
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomDimens.primaryBtnRadius),
        ),
        backgroundColor: 
             CustomColors.primaryColor
            // Use primary color if isSelected is true
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: CustomDimens.primaryBtnText,
            fontFamily: CustomFont.fontMedium,
            color: 
                 CustomColors.primaryBtnText
                // Use primary text color if isSelected is true
          ),
        ),
      ),
    );
  }
}
