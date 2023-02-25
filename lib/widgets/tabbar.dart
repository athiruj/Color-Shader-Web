import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class ThisTabbar extends StatelessWidget {
  const ThisTabbar({super.key, this.height, this.width});

  final double? height;

  final double? width;
  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);
    return Container(
      height: height ?? 46,
      width: width ?? 530,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(23)),
      ),
      child: TabBar(
        indicatorWeight: 0.1,
        splashBorderRadius: const BorderRadius.all(Radius.circular(23)),
        controller: tabPage.controller,
        tabs: const [
          Tab(
            text: 'Palette',
          ),
          Tab(text: 'LightPalette'),
          Tab(text: 'DarkPalette'),
        ],
      ),
    );
  }
}
