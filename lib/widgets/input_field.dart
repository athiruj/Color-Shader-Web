import 'package:color_shader_website/providers/value_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, this.width, this.height});

  final double? height;

  final double? width;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller =
        TextEditingController(text: ValuesProvider.defaultValue);

    return Container(
      width: width ?? 530,
      height: height ?? 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          border: Border.all(
              color: Theme.of(context).colorScheme.onPrimary, width: 4),
          borderRadius: const BorderRadius.all(Radius.circular(23))),
      child: Consumer(
        builder: (context, ValuesProvider provider, Widget? child) {
          void onChanged(String value) {
            if (value.length == 6) {
              controller.text == '' ? null : provider.setValue(value);
            }
          }

          return TextField(
            controller: controller,
            autofocus: true,
            obscureText: false,
            maxLength: 6,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: 'Enter Color Here #000000',
                hintStyle: Theme.of(context).textTheme.titleSmall,
                filled: false,
                border: InputBorder.none,
                counterText: ''),
            cursorColor: Theme.of(context).colorScheme.primaryContainer,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.top,
            inputFormatters: [
              UpperCaseTextFormatter(),
              FilteringTextInputFormatter.allow(
                  RegExp('[0123456789abcdefABCDEF]'))
            ],
            onChanged: onChanged,
          );
        },
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
