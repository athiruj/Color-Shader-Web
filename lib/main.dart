import 'package:color_shader_website/providers/value.dart';
import 'package:flutter/material.dart';
import '/routes.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:responsive_builder/responsive_builder.dart';
import 'package:routemaster/routemaster.dart';

// import 'package:color_shader/color_shader.dart';

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
            fontFamily: GoogleFonts.openSans().fontFamily,
            primaryColorDark: const Color(0xff1A1A1A),
            textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff1A1A1A)),
              bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1A1A1A)),
              // bodyText1:const  TextStyle(),
            )),
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
        return const Mobile();
      }),
    );
  }
}

class Desktop extends StatefulWidget {
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
    final tabPage = TabPage.of(context);
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    Ratio size = Ratio(maxHeight: maxHeight, maxWidth: maxWidth);
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(
          child: SizedBox(
            width: size.box * 10,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        'Color Shader',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.margin,
                    child: Container(),
                  ),
                  SizedBox(
                    width: size.box * 8,
                    child: TabBar(
                      controller: tabPage.controller,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                      labelStyle: Theme.of(context).textTheme.bodyText1,
                      labelColor: Theme.of(context).primaryColorDark,
                      indicatorColor: Theme.of(context).primaryColorDark,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      tabs: const <Tab>[
                        Tab(text: 'palette'),
                        Tab(text: 'lightPalette'),
                        Tab(text: 'darkPalette'),
                        Tab(text: 'lightness'),
                        Tab(text: 'darkness'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.margin * 3,
                    child: Container(),
                  ),
                  Container(
                    height: size.box,
                    width: size.box * 10,
                    child: TabBarView(
                      controller: tabPage.controller,
                      children: [
                        for (final stack in tabPage.stacks)
                          PageStackNavigator(stack: stack)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.margin,
                    child: Container(),
                  ),
                  const FirstState()
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

class FirstState extends StatefulWidget {
  const FirstState({super.key});

  @override
  State<FirstState> createState() => _FirstStateState();
}

class _FirstStateState extends State<FirstState> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
        double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    Ratio size = Ratio(maxHeight: maxHeight, maxWidth: maxWidth);
    return Container(
      color: Colors.amber,
      child: Consumer(
        builder: (context, ValuesProvider provider, Widget? child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: size.box * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 56,
                      child: TextField(
                        controller: controller,
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                        maxLength: 6,
                        
                        // minLines: 1,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Checkbox(
                              value: provider.fullScale,
                              onChanged: ((value) =>
                                  provider.setFullScale(!provider.fullScale))),
                        ),
                        Text(
                          "FullScale",
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
