import 'dart:html';

import 'package:flutter/material.dart';
import 'package:color_shader_web/routes.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

// import 'package:color_shader/color_shader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: initialRoute,
      title: 'Color Shader',
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ScreenTypeLayout(
//         breakpoints:
//             const ScreenBreakpoints(tablet: 757, desktop: 1193, watch: 0),
//         desktop: const Desktop(),
//         tablet: const Tablet(),
//         mobile: const Mobile(),
//       ),
//     );
//   }
// }

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
        return const Mobile();
      }),
    );
  }
}

class Desktop extends StatefulWidget {
  // static double? maxHeight;
  // static  double? maxWidth;

  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class Ratio {
  double maxHeight;
  double maxWidth;
  static const designHeight = 840;
  static const designWidth = 1800;

  Ratio({
    required this.maxHeight,
    required this.maxWidth,
  });

  double get heightRatio => maxHeight / designHeight;
  double get widthRatio => maxWidth / designWidth;

  double get tablet => heightRatio * 1040;
  double get header => heightRatio * 44;
  double get box => heightRatio * 112.8;
  double get footer => heightRatio * 54;

  double get margin => heightRatio * 28;
}

class _DesktopState extends State<Desktop> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    Ratio size = Ratio(maxHeight: maxHeight, maxWidth: maxWidth);
    return Scaffold(
      body: Column(
          // crossAxisAlignment: CrossAxisAl
          children: <Widget>[
            Expanded(
              child: SizedBox(
                width: size.box * 10,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Colors.brown,
                        child: Row(
                          children: [
                            Text(
                              maxHeight.toString(),
                              style: const TextStyle(fontSize: 28),
                            ),
                            SizedBox(
                              width: 20,
                              height: 10,
                              child: Container(),
                            ),
                            Text(
                              maxWidth.toString(),
                              style: const TextStyle(fontSize: 28),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.margin,
                        child: Container(),
                      ),
                      Container(
                        height: 28,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        height: size.margin * 2,
                        child: Container(),
                      ),
                      Container(
                        height: size.box,
                        width: size.box * 10,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        height: size.margin,
                        child: Container(),
                      ),
                      Container(
                        height: size.box * 3,
                        color: Colors.amber,
                        child: AspectRatio(
                          aspectRatio: 1.5/1,
                          child: Container(
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ]),
              ),
            ),
            Container(
              color: Colors.grey,
              height: size.footer,
              // width: double.infinity,
            )
          ]),
    );
  }
}

class Tablet extends StatefulWidget {
  const Tablet({super.key});

  @override
  State<Tablet> createState() => _TabletState();
}

class _TabletState extends State<Tablet> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.amber);
  }
}

class Mobile extends StatefulWidget {
  const Mobile({super.key});

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.brown);
  }
}
