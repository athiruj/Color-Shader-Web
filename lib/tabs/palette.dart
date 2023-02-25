import 'package:color_shader_website/widgets/color_container.dart';
import 'package:flutter/material.dart';
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
      return Row(
        children: [
          for (var i in provider.palette())
            Expanded(
              child: ThisColorContainer(color: i,text: i.toString(),),
            )
        ],
      );
    });
  }
}
