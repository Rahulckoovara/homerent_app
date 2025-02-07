import 'package:flutter/material.dart';
import 'package:tappal_app/config/custom_colors.dart';

class Progressbar extends StatelessWidget {
  const Progressbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CircularProgressIndicator(
        color: CustomColors.primaryColor,
      ),
    );
  }
}
