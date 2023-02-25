import 'package:color_shader_website/widgets/controller.dart';
import 'package:color_shader_website/widgets/input_field.dart';
import 'package:color_shader_website/widgets/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);
    return Scaffold(
      body: Stack(children: <Widget>[
        TabBarView(
          controller: tabPage.controller,
          children: [
            for (final stack in tabPage.stacks)
              PageStackNavigator(stack: stack),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [InputField(), ThisTabbar(), Controller()],
          ),
        ),
        //  Controller(),
        // Align(
        //   alignment: Alignment.topCenter,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       // Text('Headline Small',
        //       //     style: Theme.of(context).textTheme.headlineSmall),
        //       Text('Title Medium',
        //           style: Theme.of(context).textTheme.titleMedium),
        //       Text('Body Large', style: Theme.of(context).textTheme.bodyLarge),
        //       Text('Body Medium',
        //           style: Theme.of(context).textTheme.bodyMedium),
        //       Text('Label Large',
        //           style: Theme.of(context).textTheme.labelLarge),
        //       Text('Label Small',
        //           style: Theme.of(context).textTheme.labelSmall),
        //       ThisCheckbox(
        //           value: false,
        //           scale: 1.35,
        //           title: 'FullScale',
        //           subTitle: 'say hello',
        //           onChanged: (c) {}),
        //       ThisSliderBox(
        //           title: 'Shader',
        //           subTitle: '   number of shades in palette',
        //           max: 10,
        //           min: 0,
        //           divisions: 10,
        //           value: value,
        //           onChanged: (v) {
        //             setState(() {
        //               value = v;
        //             });
        //           }),
        //     ],
        //   ),
        // ),
      ]),
    );
  }
}
