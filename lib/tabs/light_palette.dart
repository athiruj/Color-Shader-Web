import 'package:color_shader_website/widgets/color_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/value_provider.dart';

class LightPalette extends StatefulWidget {
  const LightPalette({super.key});

  @override
  State<LightPalette> createState() => _LightPaletteState();
}

class _LightPaletteState extends State<LightPalette> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ValuesProvider provider, Widget? child) {
      return Row(
        children: [
          for (var i in provider.lightPalette())
            ThisColorContainer(
              color: i,
              text: i
                  .toString()
                  .split('Color(0xff')[1]
                  .split(')')[0]
                  .toUpperCase(),
            )
        ],
      );
    });
  }
}
