import 'package:flutter/material.dart';

class ThisCheckbox extends StatelessWidget {
  const ThisCheckbox(
      {super.key,
      this.scale = 1,
      required this.title,
      required this.subTitle,
      this.titleStyle,
      this.subTitleStyle,
      required this.value,
      this.tristate = false,
      required this.onChanged,
      this.mouseCursor,
      this.activeColor,
      this.fillColor,
      this.checkColor,
      this.focusColor,
      this.hoverColor,
      this.overlayColor,
      this.splashRadius,
      this.materialTapTargetSize,
      this.visualDensity,
      this.focusNode,
      this.autofocus = false,
      this.shape,
      this.side});

  final double? scale;
  final String title;
  final String subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final bool value;
  final bool tristate;
  final void Function(bool?)? onChanged;
  final MouseCursor? mouseCursor;
  final Color? activeColor;
  final MaterialStateProperty<Color?>? fillColor;
  final Color? checkColor;
  final Color? focusColor;
  final Color? hoverColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final FocusNode? focusNode;
  final bool autofocus;
  final OutlinedBorder? shape;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Transform.scale(
              scale: scale,
              child: Checkbox(
                key: key,
                value: value,
                tristate: tristate,
                onChanged: onChanged,
                mouseCursor: mouseCursor,
                activeColor: activeColor,
                fillColor: fillColor,
                checkColor: checkColor,
                focusColor: focusColor,
                hoverColor: hoverColor,
                overlayColor: overlayColor,
                splashRadius: splashRadius,
                materialTapTargetSize: materialTapTargetSize,
                visualDensity: visualDensity,
                focusNode: focusNode,
                autofocus: autofocus,
                shape: shape,
                side: side,
              ),
            ),
          ),
          RichText(
              text: TextSpan(
                  text: title,
                  style: titleStyle ?? Theme.of(context).textTheme.bodyMedium,
                  children: [
                const WidgetSpan(child: SizedBox(width: 10)),
                TextSpan(
                    text: subTitle,
                    style:
                        subTitleStyle ?? Theme.of(context).textTheme.labelLarge)
              ])),
        ],
      ),
    );
  }
}
