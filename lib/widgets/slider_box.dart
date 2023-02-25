import 'package:flutter/material.dart';

class ThisSliderBox extends StatelessWidget {
  const ThisSliderBox({
    super.key,
    this.width,
    required this.title,
    required this.subTitle,
    this.titleStyle,
    this.subTitleStyle,
    required this.value,
    this.secondaryTrackValue,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.minLabel,
    this.maxLabel,
    this.divisions,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.secondaryActiveColor,
    this.thumbColor,
    this.overlayColor,
    this.mouseCursor,
    this.semanticFormatterCallback,
    this.focusNode,
    this.autofocus = false,
  });

  final double? width;
  final String title;
  final String subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final double value;
  final double? secondaryTrackValue;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;
  final double max;
  final double min;
  final String? maxLabel;
  final String? minLabel;
  final int? divisions;
  final String? label;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? secondaryActiveColor;
  final Color? thumbColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final MouseCursor? mouseCursor;
  final SemanticFormatterCallback? semanticFormatterCallback;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 530.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Slider(
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            min: min,
            max: max,
            value: value,
            label: value.round().toString(),
            divisions: divisions,
            onChanged: onChanged,
            onChangeStart: onChangeStart,
            onChangeEnd: onChangeEnd,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 40,
                child: Text(
                  minLabel ?? min.round().toString(),
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.start,
                ),
              ),
              RichText(
                  text: TextSpan(
                      text: title,
                      style:
                          titleStyle ?? Theme.of(context).textTheme.bodyMedium,
                      children: [
                    const WidgetSpan(child: SizedBox(width: 10)),
                    TextSpan(
                        text: subTitle,
                        style: subTitleStyle ??
                            Theme.of(context).textTheme.labelLarge)
                  ])),
              SizedBox(
                width: 40,
                child: Text(
                  maxLabel ?? max.round().toString(),
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
