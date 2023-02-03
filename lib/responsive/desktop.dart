import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../controller.dart';
import '../providers/value_provider.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  final GlobalKey keyBox = GlobalKey();
  Size size = Size(200,200);
  Offset position = Offset(10,20);

  @override
  void initState() {
    super.initState();

    calculateSizeAndPosition();
  }

  void calculateSizeAndPosition() =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        RenderBox box = keyBox.currentContext?.findRenderObject() as RenderBox;
        

        setState(() {
          position = box.localToGlobal(Offset.zero);
          size = box.size;
          print(position);
          print(size);
        });
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Stack(
          children: <Widget>[
            Row(
              children: [
                Expanded(child: Container(color: Colors.red,)),
                Expanded(child: Container(color: Colors.amber,)),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Controller(key: keyBox,)),
            TextButton(onPressed: (){calculateSizeAndPosition();}, child: Text('Hello'))
            ]),
    );
  }
}