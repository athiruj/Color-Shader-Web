import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: 1080,
        height: double.maxFinite,
        color: Colors.red,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Hello',
              style: GoogleFonts.openSans(
                  fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 38,
            ),
            Container(
              height: 53,
              width: 200,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 56,
            ),
            Container(
              height: 108,
              width: double.maxFinite,
              color: Colors.green,
            ),
          ]),
        ),
      )
    ]);
  }
}

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(),
    );
  }
}
