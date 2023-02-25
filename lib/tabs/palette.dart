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
          for (var i =0 ; i < provider.palette().length ; i++)
            Expanded(
              child: ThisColorContainer(
                defaultValue: i == provider.index ? true : false,
                color: provider.palette()[i],
                text: provider.palette()[i]
                    .toString()
                    .split('Color(0xff')[1]
                    .split(')')[0]
                    .toUpperCase(),
              ),
            )
        ],
      );
    });
  }
}
