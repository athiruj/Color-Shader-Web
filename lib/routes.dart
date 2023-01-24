import 'dart:js';

import 'package:color_shader_web/providers/state.dart';
import 'package:flutter/material.dart';
import 'package:color_shader_web/main.dart';
import 'package:routemaster/routemaster.dart';

// var stateProvider = Provider.of<StateProvider>(listen: false);

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
