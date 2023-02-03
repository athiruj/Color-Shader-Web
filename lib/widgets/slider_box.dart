import 'package:flutter/material.dart';

class SliderBox extends StatelessWidget {
  const SliderBox({
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
      width: width ?? 540.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                    text: TextSpan(
                        text: title,
                        style: titleStyle ??
                            Theme.of(context).textTheme.titleMedium,
                        children: [
                      TextSpan(
                          text: subTitle,
                          style: subTitleStyle ??
                              Theme.of(context).textTheme.bodyLarge)
                    ]))
              ]),
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                minLabel ?? min.round().toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              
              Text(
                maxLabel ?? max.round().toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
