import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../controller.dart';
import '../models/ratio_scale.dart';
import '../providers/value_provider.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    Ratio size = Ratio(maxHeight: maxHeight, maxWidth: maxWidth);
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(
          child: SizedBox(
            width: size.box * 10,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        'Color Shader',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.margin,
                    child: Container(),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.box * 8,
                        child: TabBar(
                          controller: tabPage.controller,
                          tabs: const <Tab>[
                            Tab(text: 'Palette'),
                            Tab(text: 'LightPalette'),
                            Tab(text: 'DarkPalette'),
                            Tab(text: 'Lightness'),
                            Tab(text: 'Darkness'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.margin * 2,
                    child: Container(),
                  ),
                  SizedBox(
                    height: size.box + 20,
                    width: size.box * 10,
                    child: TabBarView(
                      controller: tabPage.controller,
                      children: [
                        for (final stack in tabPage.stacks)
                          PageStackNavigator(stack: stack)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.margin,
                    child: Container(),
                  ),
                  SizedBox(
                    width: size.contr,
                    child: Column(
                      children: [
                        Consumer(builder:
                            (context, ValuesProvider provider, Widget? child) {
                          return Row(
                            mainAxisSize: MainAxisSize.max,
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
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.enforced,
                                  decoration: InputDecoration(
                                    counter: const SizedBox(),
                                    hintText: '000000',
                                    hintStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder:
                                        const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0123456789abcdefABCDEF]'))
                                  ],
                                  onChanged: ((value) {
                                    provider.value = value.toUpperCase();
                                    controller.text = value.toUpperCase();
                                    controller.selection =
                                        TextSelection.collapsed(
                                            offset: controller.text.length);
                                  }),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: Transform.scale(
                                      scale: 1.35,
                                      child: Checkbox(
                                        value: provider.fullScale,
                                        onChanged: (_) async {
                                          setState(() => provider.setFullScale(
                                              !provider.fullScale));
                                        },
                                        activeColor:
                                            Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'FullScale',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                        const Controller(),
                      ],
                    ),
                  )
                ]),
          ),
        ),
        Container(
          color: Colors.grey,
          height: size.footer,
          // width: double.infinity,
        )
      ]),
    );
  }
}