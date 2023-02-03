import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'theme/ThisTheme.dart';

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
          fontFamily: ThisTheme.fontFamily,
          primaryColorDark: ThisTheme.color,
          disabledColor: ThisTheme.subColor,
          textTheme: ThisTheme.textTheme,
          sliderTheme: const SliderThemeData(
            activeTrackColor: ThisTheme.color),
          
          checkboxTheme:  CheckboxThemeData(
            // activeColor: ThisTheme.color,
              shape: const  CircleBorder(),
              splashRadius: 10,
              fillColor: MaterialStateProperty.all(ThisTheme.color),
              checkColor: MaterialStateProperty.all(Colors.white),

              side:const BorderSide(color: ThisTheme.subColor, width: 2)),

          unselectedWidgetColor: ThisTheme.subColor,
          tabBarTheme: TabBarTheme(
            indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: ThisTheme.color, width: 2)),
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: ThisTheme.textTheme.headlineMedium,
            labelColor: ThisTheme.color,
            unselectedLabelStyle: ThisTheme.textTheme.headlineSmall,
            unselectedLabelColor: ThisTheme.subColor,
            // overlayColor:
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = WidgetsBinding.instance.window.physicalSize;
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




// class Mobile extends StatefulWidget {
//   const Mobile({super.key});

//   @override
//   State<Mobile> createState() => _MobileState();
// }

// class _MobileState extends State<Mobile> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Colors.brown);
//   }
// }

