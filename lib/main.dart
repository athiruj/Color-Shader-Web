import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'theme/thistheme.dart';

import '/routes.dart';
import 'providers/value_provider.dart';
import 'responsive/desktop.dart';
import 'responsive/tablet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ValuesProvider())
      ],
      child: MaterialApp.router(
        routerDelegate: RoutemasterDelegate(routesBuilder: (_) => routes),
        routeInformationParser: const RoutemasterParser(),
        title: 'Color Shader',
        theme: ThemeData(
          colorScheme: ThisTheme.colorScheme,
          fontFamily: ThisTheme.fontFamily,
          textTheme: ThisTheme.textTheme,
          sliderTheme: ThisTheme.sliderTheme,
          checkboxTheme: ThisTheme.checkboxTheme,
          tabBarTheme: ThisTheme.tabBarTheme,
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Size screenSize = WidgetsBinding.instance.window.physicalSize;
    // double width = screenSize.width;
    // double height = screenSize.height;
    // Ratio size = Ratio(maxHeight: height, maxWidth: width);
    return LayoutBuilder(
      builder: ((BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 740) {
          return const Desktop();
        }
        return const Tablet();
      }),
    );
  }
}
