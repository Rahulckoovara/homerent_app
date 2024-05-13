import 'package:flutter/material.dart';
import 'package:tappal_app/common/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';

class SelectableButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isSelected;

  const SelectableButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomDimens.primaryBtnRadius),
        ),
        backgroundColor: isSelected ? CustomColors.primaryColor : Colors.grey,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(text,
         style: TextStyle(
            fontSize: CustomDimens.primaryBtnText,
            color: 
                 CustomColors.primaryBtnText
                // Use primary text color if isSelected is true
          ),
        ),
      ),
    );
  }
}