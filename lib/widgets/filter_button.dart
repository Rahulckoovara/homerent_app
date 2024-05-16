import 'package:flutter/material.dart';
import 'package:tappal_app/config/custom_dia.dart';

class FilterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const FilterButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
     onPressed: onPressed,
     style: IconButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(CustomDimens.primaryBtnRadius)
  ),
  backgroundColor: Colors.white
  
),
icon: Padding(
  padding: const EdgeInsets.all(1.0),
  child: Icon(icon),
),

    );
  }
}