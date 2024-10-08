import 'package:flutter/material.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/config/custom_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? status; // Make status optional by using nullable String

  const PrimaryButton(
    this.onPressed,
    this.text, {
    this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    bool isDisabled = false;
    String buttonText = text;

    if (status == 'pending') {
      buttonColor = Colors.red[100]!;
      isDisabled = true; // Disable the button when status is pending
      buttonText = "Your request is submitted";
    } else if (status == 'seen') {
      buttonColor = Colors.green;
      isDisabled = true; // Disable the button when status is seen
      buttonText = "You request is seen by owner ";
    } else {
      buttonColor = CustomColors.primaryColor;
      isDisabled = false;
    }

    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed, // Disable if needed
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomDimens.primaryBtnRadius),
        ),
        backgroundColor: isDisabled
            ? Colors.red
            : buttonColor, // Set button color based on status
        disabledBackgroundColor: isDisabled && status == 'seen'
            ? Colors.green
            : Colors.red, // Explicit disabled color
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: CustomDimens.primaryBtnText,
            fontFamily: CustomFont.fontMedium,
            color: CustomColors.primaryBtnText,
          ),
        ),
      ),
    );
  }
}
