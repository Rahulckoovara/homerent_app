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
  final bool isAllowAllCharacter;
  final String? errorText;
  final int? maxLength;
  final int? maxlines;
  
  const TextInput(
    this.labelText,
    this.hintText,
    this.icon,
    this.obscureText,
    this.onChanged,{
    super.key,
    this.keyboardType = TextInputType.text,
    this.isAllowAllCharacter = true,
    this.maxLength,
    this.errorText,
    this.maxlines,
  });

  @override
  Widget build(BuildContext context) {
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
          inputFormatters: isAllowAllCharacter
              ? []
              : [
                  FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s,-.]")),
                ],
          onChanged: onChanged,
          maxLines: maxlines,
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
                  color: const Color.fromARGB(255, 118, 12, 12),
                  width: CustomDimens.txtinputborderW,
                )),
            counterText: '',
            errorText:          
            errorText != null && errorText!.isNotEmpty ? errorText : null,
            errorStyle: const TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
