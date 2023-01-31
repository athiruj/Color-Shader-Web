import 'package:flutter/material.dart';
import 'package:color_shader/color_shader.dart';
import 'package:provider/provider.dart';

import '../providers/value_provider.dart';

class Palette extends StatefulWidget {
  const Palette({super.key});

  @override
  State<Palette> createState() => _PaletteState();
}

class _PaletteState extends State<Palette> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ValuesProvider provider, Widget? child) {
      List<Color> colors = Shader(int.parse('0x${provider.value}'),
              shades: provider.shades,
              index: provider.index,
              fullScale: provider.fullScale)
          .palette(scale: provider.scale / 100);
      return Row(
        children: [
          for (var i in provider.palette())
            Expanded(
              child: Container(color: i),
            )
        ],
      );
    });
  }
}
