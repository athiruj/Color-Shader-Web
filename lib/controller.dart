import 'dart:ui';

import 'package:color_shader_website/widgets/slider_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'providers/value_provider.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  TextEditingController controller =
      TextEditingController(text: ValuesProvider.defaultValue);
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
      child: Container(
        width: 540,
        decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer(
            builder: (context, ValuesProvider provider, Widget? child) {
              return Wrap(
                direction: Axis.horizontal,
                // runAlignment: WrapAlignment.spaceBetween,
                // spacing: 20,
                runSpacing: 20,
                // crossAxisAlignment: WrapCrossAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 140,
                        height: 56,
                        child: TextFormField(
                          controller: controller,
                          autofocus: true,
                          textCapitalization: TextCapitalization.words,
                          obscureText: false,
                          maxLength: 6,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          decoration: InputDecoration(
                            counter: const SizedBox(),

                            hintText: '000000',
                            hintStyle: Theme.of(context).textTheme.bodyLarge,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).disabledColor,
                                width: 2,
                              ),
                              // borderRadius: BorderRadius.only(
                              //   topLeft: Radius.circular(4.0),
                              //   topRight: Radius.circular(4.0),
                              // ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColorDark,
                                width: 2,
                              ),
                              // borderRadius: BorderRadius.only(
                              //   topLeft: Radius.circular(4.0),
                              //   topRight: Radius.circular(4.0),
                              // ),
                            ),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffff0000),
                                width: 2,
                              ),
                              // borderRadius: BorderRadius.only(
                              //   topLeft: Radius.circular(4.0),
                              //   topRight: Radius.circular(4.0),
                              // ),
                            ),
                            // focusedErrorBorder:
                            //     const UnderlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: Color(0x00000000),
                            //     width: 1,
                            //   ),
                            //   borderRadius: BorderRadius.only(
                            //     topLeft: Radius.circular(4.0),
                            //     topRight: Radius.circular(4.0),
                            //   ),
                            // ),
                          ),
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[0123456789abcdefABCDEF]'))
                          ],
                          onChanged: ((value) {
                            controller.text == ''
                                ? null
                                : provider.setValue(value.toUpperCase());
                            controller.text =
                                controller.text == '' ? '' : provider.value;
                            controller.selection = TextSelection.collapsed(
                                offset: provider.value.length);
                          }),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                value: provider.fullScale,
                                onChanged: (_) async {
                                  setState(() => provider
                                      .setFullScale(!provider.fullScale));
                                },
                                // activeColor:
                                // Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          Text(
                            'FullScale',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SliderBox(
                      title: 'Shader',
                      subTitle: "   Number of Shades in palette",
                      value: provider.shades.toDouble(),
                      max: 20,
                      min: 2,
                      divisions: 18,
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
          ),
        ),
      ),
    );
  }
}
