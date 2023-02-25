import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'theme/theme.dart';

import '/routes.dart';
import 'providers/value_provider.dart';
import 'responsive/desktop.dart';

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
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) { 
    return Stack(
      children: [
        Desktop(mobile: constraints.maxWidth <= 560 ? true : false),
        DropdownAlert(
          titleStyle: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
    },) ;
    
  }
}
