
import 'package:color_shader_website/widgets/dark_palette.dart';
import 'package:color_shader_website/widgets/light_palette.dart';
import 'package:color_shader_website/widgets/palette.dart';
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
          '/lightness',
          '/darkness'
        ],
      ),
  '/palette': (route) => const MaterialPage(
          child: Palette()),
  '/lightPalette': (route) => const MaterialPage(
          child: LightPalette()),
  '/darkPalette': (route) => const MaterialPage(
          child: DarkPalette()),
  '/lightness': (route) => MaterialPage(
          child: Container(
        color: Colors.green,
      )),
  '/darkness': (route) => MaterialPage(
          child: Container(
        color: Colors.red,
      )),
});
