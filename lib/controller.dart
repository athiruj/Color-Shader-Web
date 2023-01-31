import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/value_provider.dart';
import 'widgets/slider_box.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  double value = 5;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ValuesProvider provider, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SliderBox(
                title: 'Shader',
                subTitle: "   Number of Shades in palette",
                value: provider.shades.toDouble(),
                max: 25,
                min: 2,
                divisions: 23,
                onChanged: (newValue) async {
                  setState(() => provider.setShades(newValue.round()));
                }),
            SliderBox(
                title: 'Index',
                subTitle: "   Position of default Color in palette",
                value: provider.index > provider.shades - 1
                    ? (provider.shades / 2).floor().toDouble()
                    : provider.index.toDouble(),
                max: provider.shades - 1,
                maxLabel: (provider.shades - 1).round().toString(),
                min: 0,
                divisions: provider.shades.round() - 1,
                onChanged: (newValue) async {
                  // print(provider.index);
                  // print(newValue);
                  setState(() => provider.setIndex(newValue.round()));
                }),
            SliderBox(
                title: 'Scale',
                subTitle: "   Percent of shade value per Color",
                value: provider.scale,
                max: 100,
                maxLabel: "100%",
                min: 0,
                minLabel: "0%",
                divisions: 10,
                onChanged: (newValue) async {
                  setState(() => provider.setScale(newValue));
                }),
          ],
        );
      },
    );
  }
}
