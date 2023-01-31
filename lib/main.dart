import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import '/theme/TextTheme.dart';

import '/routes.dart';
import 'providers/value_provider.dart';
import 'models/ratio_scale.dart';
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
          fontFamily: ThisTextTheme.fontFamily,
          primaryColorDark: ThisTextTheme.color,
          disabledColor: ThisTextTheme.subColor,
          textTheme: ThisTextTheme(),
          sliderTheme: const SliderThemeData(activeTrackColor: Colors.red),
          
          checkboxTheme:  CheckboxThemeData(
            // activeColor: ThisTextTheme.color,
              shape: const  CircleBorder(),
              splashRadius: 10,
              fillColor: MaterialStateProperty.all(ThisTextTheme.color),
              checkColor: MaterialStateProperty.all(Colors.white),

              side: const BorderSide(color: ThisTextTheme.subColor, width: 2)),

          unselectedWidgetColor: ThisTextTheme.subColor,
          tabBarTheme: TabBarTheme(
            indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: ThisTextTheme.color, width: 2)),
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: ThisTextTheme().headlineMedium,
            labelColor: ThisTextTheme.color,
            unselectedLabelStyle: ThisTextTheme().headlineSmall,
            unselectedLabelColor: ThisTextTheme.subColor,
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
    double width = screenSize.width;
    double height = screenSize.height;
    Ratio size = Ratio(maxHeight: height, maxWidth: width);
    return LayoutBuilder(
      builder: ((BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > size.tablet) {
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

