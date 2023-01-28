import 'package:color_shader_website/providers/value_provider.dart';
import 'package:color_shader_website/theme.dart';
import 'package:color_shader_website/widgets/slider_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/routes.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/rendering.dart';
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
          // activeColor: Colors.amber,
          fontFamily: GoogleFonts.openSans().fontFamily,
          primaryColorDark: const Color(0xff1A1A1A),
          textTheme: ThisTextTheme(),
          sliderTheme: const SliderThemeData(activeTrackColor: Colors.red),
          checkboxTheme: const CheckboxThemeData(
              shape: CircleBorder(),
              splashRadius: 8,
              side: BorderSide(color: Color(0xFFE6E6E6), width: 2)),
          unselectedWidgetColor: const Color(0xFFB6B6B6),
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
  double get contr => widthRatio * 640;
  double get box => heightRatio * 112.8;
  double get footer => heightRatio * 54;

  double get margin => heightRatio * 28;
}

class _DesktopState extends State<Desktop> {
  TextEditingController controller = TextEditingController();

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        'Color Shader',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.margin,
                    child: Container(),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 1000,
                        child: TabBar(
                          controller: tabPage.controller,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                          labelStyle: Theme.of(context).textTheme.headlineSmall,
                          labelColor: Theme.of(context).primaryColorDark,
                          indicatorColor: Theme.of(context).primaryColorDark,
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          tabs: const <Padding>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Tab(text: 'palette'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Tab(text: 'lightPalette'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Tab(text: 'darkPalette'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Tab(text: 'lightness'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Tab(text: 'darkness'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.margin * 2,
                    child: Container(),
                  ),
                  Container(
                    height: size.box + 20,
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
                  SizedBox(
                    width: size.contr,
                    child: Column(
                      children: [
                        Consumer(builder:
                            (context, ValuesProvider provider, Widget? child) {
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 140,
                                height: 56,
                                child: TextFormField(
                                  controller: controller,
                                  autofocus: true,
                                  textCapitalization: TextCapitalization.words,
                                  obscureText: false,
                                  maxLength: 6,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.enforced,
                                  decoration: InputDecoration(
                                    counter: const SizedBox(),
                                    hintText: '000000',
                                    hintStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder:
                                        const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0123456789abcdefABCDEF]'))
                                  ],
                                  onChanged: ((value) {
                                    provider.value = value.toUpperCase();
                                    controller.text = value.toUpperCase();
                                    controller.selection =
                                        TextSelection.collapsed(
                                            offset: controller.text.length);
                                  }),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: Transform.scale(
                                      scale: 1.35,
                                      child: Checkbox(
                                        value: provider.fullScale,
                                        onChanged: (_) async {
                                          setState(() => provider.fullScale =
                                              !provider.fullScale);
                                        },
                                        activeColor:
                                            Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'FullScale',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                        FirstState(),
                      ],
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

class FirstState extends StatefulWidget {
  const FirstState({super.key});

  @override
  State<FirstState> createState() => _FirstStateState();
}

class _FirstStateState extends State<FirstState> {
    double value = 5;
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    Ratio size = Ratio(maxHeight: maxHeight, maxWidth: maxWidth);
    return Consumer(
      builder: (context, ValuesProvider provider, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SliderBox(
                title: 'Shader',
                subTitle: " subtitle",
                value: provider.shades,
                max: 25,
                min: 0,
                divisions: 25,
                onChanged: (newValue) async {
                  setState(() => provider.shades = newValue);
                }),
            
          ],
        );
      },
    );
  }
}
