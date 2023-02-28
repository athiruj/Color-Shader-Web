import 'package:color_shader_website/widgets/controller.dart';
import 'package:color_shader_website/widgets/input_field.dart';
import 'package:color_shader_website/widgets/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:routemaster/routemaster.dart';
import 'package:url_launcher/url_launcher.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key, this.mobile = false});

  final bool mobile;

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  double value = 0;

  final Uri url = Uri.parse('https://github.com/athiruj/color_hue_n_tint');
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (() => setState(() {
                  visible = !visible;
                })),
            child: const Icon(
              Remix.settings_5_fill,
              size: 24,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: () async {
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            child: const Icon(
              Remix.github_fill,
              size: 32,
            ),
          ),
        ],
      ),
      body: Stack(children: <Widget>[
        RotatedBox(
          quarterTurns: widget.mobile ? -1 : 0,
          child: TabBarView(
            controller: tabPage.controller,
            children: [
              for (final stack in tabPage.stacks)
                PageStackNavigator(stack: stack),
            ],
          ),
        ),
        controllerMenu()
      ]),
    );
  }

  Widget controllerMenu() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.center,
        child: Visibility(
          visible: visible,
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
      ),
    );
  }
}
