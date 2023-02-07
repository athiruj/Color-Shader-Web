import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/value_provider.dart';

class DarkPalette extends StatefulWidget {
  const DarkPalette({super.key});

  @override
  State<DarkPalette> createState() => _DarkPaletteState();
}

class _DarkPaletteState extends State<DarkPalette> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ValuesProvider provider, Widget? child) {
      return Row(
        children: [
          for (var i in provider.darkPalette())
            Expanded(
              child: Container(color: i),
            )
        ],
      );
    });
  }
}
