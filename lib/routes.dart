
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
  '/palette': (route) => MaterialPage(
          child: Container(
        color: Colors.blue,
      )),
  '/lightPalette': (route) => MaterialPage(
          child: Container(
        color: Colors.green,
      )),
  '/darkPalette': (route) => MaterialPage(
          child: Container(
        color: Colors.blue,
      )),
  '/lightness': (route) => MaterialPage(
          child: Container(
        color: Colors.green,
      )),
  '/darkness': (route) => MaterialPage(
          child: Container(
        color: Colors.red,
      )),
});
