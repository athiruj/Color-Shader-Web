import 'package:color_shader_website/widgets/slider_box.dart';
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
  Size size = Size(200, 200);
  Offset position = Offset(10, 20);
  double value = 5.0;

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
      body: Stack(children: <Widget>[
        Row(
          children: [
            Expanded(
                child: Container(
              color: Colors.white,
            )),
            // Expanded(
            //     child: Container(
            //   color: Colors.white,
            // )),
          ],
        ),
        // Align(
        //     alignment: Alignment.center,
        //     child: Controller(
        //       key: keyBox,
        //     )),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text('Headline Small',
              //     style: Theme.of(context).textTheme.headlineSmall),
              Text('Title Medium',
                  style: Theme.of(context).textTheme.titleMedium),
              Text('Body Large', style: Theme.of(context).textTheme.bodyLarge),
              Text('Body Medium', style: Theme.of(context).textTheme.bodyMedium),
              Text('Label Large',
                  style: Theme.of(context).textTheme.labelLarge),
              Text('Label Small',
                  style: Theme.of(context).textTheme.labelSmall),
              SliderBox(
                  title: 'Shader',
                  subTitle:'   number of shades in palette',
                  max: 10,
                  min: 0,
                  divisions: 10,
                  value: value,
                  onChanged: (v) {
                    setState(() {
                      value = v;
                    });
                  }),
             
            ],
          ),
        ),
      ]),
    );
  }
}
