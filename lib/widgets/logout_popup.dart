import 'package:flutter/material.dart';
import 'package:tappal_app/widgets/primary_button.dart';
import 'package:tappal_app/widgets/secondary_button.dart';


class LogoutPopup extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback primaryAction;
  final VoidCallback secondaryAction;
  final String primaryButtonText;
  final String secondaryButtonText;

  const LogoutPopup({
    super.key,
    required this.title,
    required this.content,
    required this.primaryAction,
    required this.secondaryAction,
    required this.primaryButtonText,
    required this.secondaryButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return (Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize:18,
          ),
        ),
        SizedBox(height:25),
        Text(
          content,
          style: TextStyle(
           
            fontSize: 14,
          ),
        ),
        SizedBox(height:25),
        Row(
          children: [
            Expanded(
                child: Secondarybutton(secondaryAction, secondaryButtonText)),
            SizedBox(width: 8),
            Expanded(child: PrimaryButton(primaryAction, primaryButtonText)),
          ],
        ),
      ],
    ));
  }
}
