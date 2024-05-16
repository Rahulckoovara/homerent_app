import 'package:flutter/material.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';

class SelectableButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isSelected;
  final Size minimumSize;

  const SelectableButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.isSelected,
    this.minimumSize = const Size(20, 45), // Default value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomDimens.primaryBtnRadius),
        ),
        backgroundColor: isSelected ? CustomColors.primaryColor : Colors.grey,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: CustomDimens.primaryBtnText,
          color: CustomColors.primaryBtnText,
        ),
      ),
    );
  }
}
