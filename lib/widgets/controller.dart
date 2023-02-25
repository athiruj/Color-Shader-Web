import 'package:color_shader_website/providers/value_provider.dart';
import 'package:color_shader_website/widgets/check_box.dart';
import 'package:color_shader_website/widgets/slider_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';

class Controller extends StatefulWidget {
  const Controller({super.key, this.tapHeight, this.height, this.width});

  final double? tapHeight;

  final double? height;

  final double? width;

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.tapHeight ?? 34,
          width: widget.width ?? 530,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.vertical(
                top: const Radius.circular(23),
                bottom: visible ? Radius.zero : const Radius.circular(23)),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  width: 46,
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    visible ? 'CONTROLLER' : 'OPEN CONTROLLER',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
                IconButton(
                  iconSize: 46,
                  padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    onPressed: () => setState(() {
                          visible = !visible;
                        }),
                    icon: Icon(
                      visible ? Remix.close_circle_fill : Remix.arrow_down_circle_fill,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 28,
                    ))
              ]),
        ),
        Visibility(
          visible: visible,
          child: Container(
            height: widget.height ?? 300,
            width: widget.width ?? 530,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(23)),
            ),
            child: Consumer(
                builder: (context, ValuesProvider provider, Widget? child) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ThisCheckbox(
                      value: provider.fullScale,
                      scale: 1.35,
                      title: 'FullScale',
                      subTitle: 'black white full range safety',
                      onChanged: (_) async {
                        setState(
                            () => provider.setFullScale(!provider.fullScale));
                      },
                    ),
                    ThisSliderBox(
                        width: widget.width! - 30,
                        title: 'Shader',
                        subTitle: 'number of shades in palette',
                        value: provider.shades.toDouble(),
                        max: 20,
                        min: 2,
                        divisions: 18,
                        onChanged: (newValue) async {
                          setState(() => provider.setShades(newValue.round()));
                        }),
                    ThisSliderBox(
                        width: widget.width! - 30,
                        title: 'Index',
                        subTitle: "Position of default Color in palette",
                        value: provider.index > provider.shades - 1
                            ? (provider.shades / 2).floor().toDouble()
                            : provider.index.toDouble(),
                        max: provider.shades - 1,
                        maxLabel: (provider.shades - 1).round().toString(),
                        min: 0,
                        divisions: provider.shades.round() - 1,
                        onChanged: (newValue) async {
                          setState(() => provider.setIndex(newValue.round()));
                        }),
                    ThisSliderBox(
                        width: widget.width! - 30,
                        title: 'Scale',
                        subTitle: "Percent of shade value per Color",
                        value: provider.scale,
                        max: 100,
                        maxLabel: "100%",
                        min: 0,
                        minLabel: "0%",
                        divisions: 10,
                        onChanged: (newValue) async {
                          setState(() => provider.setScale(newValue));
                        }),
                  ]);
            }),
          ),
        ),
      ],
    );
  }
}
