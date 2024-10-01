import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/config/custom_fonts.dart';

class CustomDropdownMenu extends StatelessWidget {
  final String labelText;
  final List<Map<String, String>> items;
  final Function(Map<String, String>) onItemSelection;
  final String? selectedvalue;
  final String? errorText;

  const CustomDropdownMenu(
      {super.key,
      required this.labelText,
      required this.items,
      required this.onItemSelection,
      this.selectedvalue,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
              fontFamily: CustomFont.fontRegular,
              fontSize: CustomDimens.txtHintFont,
              color: Colors.black,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: CustomDimens.txtHintSpacer,
        ),
        DropdownButtonFormField<String>(
          hint: Text(
            "Select",
            style: TextStyle(
              fontSize: CustomDimens.txtHintFont,
              color: CustomColors.txtfieldHint,
              fontFamily: CustomFont.fontRegular,
            ),
          ),
          // value: selectedvalue,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Color(0xFFE2E2E2),
                width: CustomDimens.txtinputborderW,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: const Color.fromARGB(
                    255, 222, 238, 189), // Your custom color
                width: CustomDimens.txtinputborderW,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: CustomColors.txtfieldBorder,
                width: CustomDimens.txtinputborderW,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorText:
                errorText != null && errorText!.isNotEmpty ? errorText : null,
            errorStyle: TextStyle(color: Colors.red),
          ),
          onChanged: (newValue) {
            // Find the corresponding item based on the selected ID
            Map<String, String>? selectedItem = items.firstWhere(
              (item) => item['id'] == newValue,
            );
            onItemSelection(selectedItem);
          },
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: CustomColors.txtfieldHint,
          ),
          items: items.map((Map<String, String> item) {
            return DropdownMenuItem<String>(
              value: item['id']!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['value']!,
                    style: TextStyle(
                      fontSize: CustomDimens.txtHintFont,
                      color: CustomColors.txtHint,
                      fontFamily: CustomFont.fontRegular,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        //}),
      ],
    );
  }
}
