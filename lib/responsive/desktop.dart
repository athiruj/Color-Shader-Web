import 'package:color_shader_website/widgets/controller.dart';
import 'package:color_shader_website/widgets/input_field.dart';
import 'package:color_shader_website/widgets/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key,this.mobile = false});

  final bool mobile;

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
        RotatedBox(
          quarterTurns: widget.mobile ? -1 :0,
          child: TabBarView(
            controller: tabPage.controller,
            children: [
              for (final stack in tabPage.stacks)
                PageStackNavigator(stack: stack),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              InputField(height: 56, width: 500),
              SizedBox(
                height: 20,
              ),
              ThisTabbar(height: 46, width: 500),
              SizedBox(
                height: 20,
              ),
              Controller(tapHeight: 46, height: 300, width: 500)
            ],
          ),
        ),
      ]),
    );
  }
}
