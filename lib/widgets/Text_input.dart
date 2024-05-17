import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/config/custom_fonts.dart';

class TextInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final String initialText;
  final bool isAllowAllCharacter;
  final int? maxLength;

  const TextInput(
    this.labelText,
    this.hintText,
    this.icon,
    this.obscureText,
    this.onChanged, {
    super.key,
    this.keyboardType = TextInputType.text,
    this.initialText = '',
    this.isAllowAllCharacter = true,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    // TextEditingController _c =
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
              fontFamily: CustomFont.fontSemiBold,
              fontSize: CustomDimens.txtHintFont,
              color: CustomColors.txtHint),
        ),
        SizedBox(
          height: CustomDimens.txtHintSpacer,
        ),
        TextField(
          controller: TextEditingController(text: initialText),
          inputFormatters: isAllowAllCharacter
              ? []
              : [
                  FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s,-.]")),
                ],
          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLength: maxLength,
          decoration: InputDecoration(
            hintText: hintText,
            
            hintStyle: TextStyle(
              fontFamily: CustomFont.fontRegular,
                color: CustomColors.txtfieldHint,
                //  fontFamily: CustomFont.fontRegular,
                fontSize: CustomDimens.txtinputLabel),
            // hintText: hintText,
            icon: icon != null ? Icon(icon) : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: CustomColors.txtfieldBorder,
                  width: CustomDimens.txtinputborderW,
                )),
            counterText: '',
          ),
        ),
      ],
    );
  }
}
