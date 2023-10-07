import 'package:dev_ui_kit/components/text.dart';
import 'package:dev_ui_kit/utils/extensions.dart';
import 'package:dev_ui_kit/utils/paddings.dart';
import 'package:dev_ui_kit/utils/sizes.dart';
import 'package:flutter/material.dart';

///
/// [ Box button with separate states]
///

enum ButtonTypes { outlined, text, icon, kDefault }

class BoxButton extends StatelessWidget {
  const BoxButton({
    super.key,
    required this.text,
    this.busy = false,
    this.textColor,
    this.padding,
    this.disabled = false,
    this.onTap,
    required this.type,
  })  : outlined = false,
        underlined = false,
        icon = const SizedBox(),
        isIconic = false,
        isTexted = false;

  const BoxButton.outlined({
    super.key,
    required this.text,
    this.textColor,
    this.padding,
    this.onTap,
    required this.type,
  })  : outlined = true,
        disabled = false,
        isTexted = false,
        icon = const SizedBox(),
        isIconic = false,
        underlined = false,
        busy = false;

  const BoxButton.text({
    super.key,
    required this.text,
    this.underlined = false,
    this.textColor,
    this.padding,
    this.onTap,
    required this.type,
  })  : outlined = false,
        disabled = false,
        icon = const SizedBox(),
        isTexted = true,
        isIconic = false,
        busy = false;
  const BoxButton.icon({
    super.key,
    required this.text,
    this.underlined = false,
    required this.icon,
    this.padding,
    this.onTap,
    required this.type,
  })  : outlined = false,
        disabled = false,
        isTexted = true,
        isIconic = true,
        textColor = null,
        busy = false;

  final String text;
  final bool busy;
  final bool disabled;
  final VoidCallback? onTap;
  final bool outlined;
  final bool isTexted;
  final bool underlined;
  final bool isIconic;
  final Widget icon;
  final Color? textColor;
  final ButtonTypes type;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonTypes.icon:
        return ElevatedButton.icon(
          style: ElevatedButton.styleFrom(padding: const PagePadding.all()),
          onPressed: () {},
          icon: icon,
          label: BoxText.btnTxt(text),
        );
      default:
        return const SizedBox.shrink();
    }
    // SizedBox(
    //   width: !isTexted ? double.infinity : null,
    //   child: ElevatedButton(
    //     onPressed: !disabled ? onTap : null,
    //     style: ElevatedButton.styleFrom(
    //       padding: padding ??
    //           (!isTexted
    //               ? EdgeInsets.zero
    //               : isIconic
    //                   ? AppPaddings.verMed
    //                   : AppPaddings.low),
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10),
    //         side: !isTexted
    //             ? BorderSide(
    //                 color: !outlined
    //                     ? ColorConstants.primary.color
    //                     : ColorConstants.another.greyColor,
    //                 width: !outlined ? 1 : 2,
    //               )
    //             : BorderSide.none,
    //       ),
    //       foregroundColor:
    //           isTexted || outlined ? ColorConstants.primary.color : null,
    //       shadowColor: Colors.transparent,
    //       backgroundColor: !isTexted
    //           ? (!outlined ? ColorConstants.primary.color : Colors.white)
    //           : isIconic
    //               ? ColorConstants.primary.color
    //               : Colors.transparent,
    //     ),
    //     child: AnimatedCrossFade(
    //       firstChild: DecoratedBox(
    //         decoration: underlined
    //             ? BoxDecoration(
    //                 border: Border(
    //                   bottom: BorderSide(
    //                     color: ColorConstants.primary.color,
    //                     width: 1.w,
    //                   ),
    //                 ),
    //               )
    //             : const BoxDecoration(),
    //         child: isIconic
    //             ? Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   icon,
    //                   AppSpacings.horLow,
    //                   BoxText.btnTxt(
    //                     text,
    //                     style: context.textTheme.bodyLarge?.copyWith(
    //                       color: !isTexted
    //                           ? (!outlined
    //                               ? Colors.white
    //                               : ColorConstants.primary.color)
    //                           : isIconic
    //                               ? Colors.white
    //                               : disabled
    //                                   ? ColorConstants.primary.color
    //                                   : textColor,
    //                       fontSize: 14.sp,
    //                     ),
    //                   ),
    //                 ],
    //               )
    //             : BoxText.btnTxt(
    //                 text,
    //                 style: context.textTheme.bodyLarge?.copyWith(
    //                   color: !isTexted
    //                       ? (!outlined
    //                           ? Colors.white
    //                           : ColorConstants.primary.color)
    //                       : isIconic
    //                           ? Colors.white
    //                           : disabled
    //                               ? ColorConstants.primary.color
    //                               : textColor,
    //                   fontSize: 14.sp,
    //                 ),
    //               ),
    //       ),
    //       secondChild: FittedBox(
    //         child: Padding(
    //           padding: AppPaddings.low,
    //           child: CircularProgressIndicator(
    //             strokeWidth: 2.w,
    //             valueColor: const AlwaysStoppedAnimation(Colors.white),
    //           ),
    //         ),
    //       ),
    //       crossFadeState:
    //           !busy ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    //       duration: const Duration(milliseconds: 350),
    //     ),
    //   ),
    // );
  }
}

///
/// [ Back button]
///
class BoxBackButton extends StatelessWidget {
  const BoxBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const PagePadding.allLow(),
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Ink(
          child: Icon(
            Icons.arrow_back,
            color: context.theme.colorScheme.onSecondary,
            size: 28,
          ),
        ),
      ),
    );
  }
}

///
/// []
///
class TitledCheckBoxButton extends StatelessWidget {
  const TitledCheckBoxButton({
    super.key,
    required this.value,
    required this.title,
    this.onChanged,
  });
  final bool value;
  final String title;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged?.call(!value),
      child: Container(
        padding: const PagePadding.allLow(),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: !value ? null : context.theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  color: context.theme.colorScheme.primary,
                  width: 1,
                ),
              ),
              child: value
                  ? const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            WidgetSizes.spacingM.boxH,
            Expanded(
              child: BoxText.caption(
                title,
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
