import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class ThisTabbar extends StatelessWidget {
  const ThisTabbar({super.key});
  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);
    return Container(
      height: 46,
      width: 566,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(23)),
      ),
      child: TabBar(
        // indicatorPadding: EdgeInsets.zero,
        // padding: EdgeInsets.zero,
        indicatorWeight: 0.1,
        splashBorderRadius: const BorderRadius.all(Radius.circular(23)),
        controller: tabPage.controller,
        tabs: const [
          Tab(
            text: 'Heloo',
          ),
          Tab(text: 'Settings'),
          Tab(text: 'palatte'),
        ],
      ),
    );
  }
}
