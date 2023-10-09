import 'package:dev_ui_kit/colors/colors.dart';
import 'package:dev_ui_kit/components/text.dart';
import 'package:dev_ui_kit/utils/extensions.dart';
import 'package:dev_ui_kit/utils/paddings.dart';
import 'package:dev_ui_kit/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
/// [ Inputs ]
///
class BoxInputField extends StatelessWidget {
  BoxInputField({
    super.key,
    required this.controller,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.password = false,
    this.phone = false,
    this.validator,
    this.inputFormatters,
    this.contentPadding,
  })  : label = null,
        borderRadius = null,
        borderColor = null,
        hasBorder = false;

  BoxInputField.labeled({
    super.key,
    required this.controller,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.password = false,
    this.phone = false,
    required this.label,
    this.validator,
    this.inputFormatters,
    this.borderRadius,
    this.contentPadding,
    this.borderColor,
    this.hasBorder = true,
  });
  BoxInputField.bordered({
    super.key,
    required this.controller,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.password = false,
    this.phone = false,
    required this.label,
    this.validator,
    this.inputFormatters,
    this.borderRadius,
    this.contentPadding,
    this.borderColor,
  }) : this.hasBorder = true;
  final TextEditingController controller;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final bool phone;
  final double? borderRadius;
  final bool hasBorder;
  final EdgeInsets? contentPadding;
  final Color? borderColor;
  final FormFieldValidator<String?>? validator;
  final List<TextInputFormatter>? inputFormatters;

  final String? label;
  final void Function()? trailingTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          BoxText.btnTxt(label!),
        ],
        TextFormField(
          validator: validator,
          controller: controller,
          style: context.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.normal),
          obscureText: password,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: context.textTheme.bodyLarge
                ?.copyWith(color: kcUILightGreyColor),
            contentPadding: contentPadding ?? const PagePadding.allNormal(),
            prefix: leading,
            suffixIcon: trailing != null
                ? GestureDetector(
                    onTap: trailingTapped,
                    child: trailing,
                  )
                : null,
            border: _circledBorder(),
            errorBorder: _circledBorder(isError: true),
            focusedBorder: _circledBorder(),
            disabledBorder: _circledBorder(),
            enabledBorder: _circledBorder(),
          ),
        ),
      ],
    );
  }

  InputBorder _circledBorder({bool isError = false}) => !hasBorder
      ? InputBorder.none
      : OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? WidgetSizes.spacingXSSs),
          borderSide: BorderSide(
              width: WidgetSizes.spacingXSS,
              color: isError ? kcUIButtonErrorColor : (borderColor ?? kcBlack)),
        );
}
