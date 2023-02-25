import 'package:color_shader_website/tabs/dark_palette.dart';
import 'package:color_shader_website/tabs/light_palette.dart';
import 'package:color_shader_website/tabs/palette.dart';
import 'package:flutter/material.dart';
import 'package:color_shader_website/main.dart';
import 'package:routemaster/routemaster.dart';

final routes = RouteMap(routes: {
  '/': (route) => const TabPage(
        child: MyHomePage(),
        paths: [
          '/palette',
          '/lightPalette',
          '/darkPalette',
        ],
      ),
  '/palette': (route) => const MaterialPage(child: Palette()),
  '/lightPalette': (route) => const MaterialPage(child: LightPalette()),
  '/darkPalette': (route) => const MaterialPage(child: DarkPalette()),
});
