import 'package:flutter/material.dart';

class DragBox extends StatefulWidget {
  const DragBox({super.key});

  @override
  State<DragBox> createState() => _DragBoxState();
}

class _DragBoxState extends State<DragBox> {
  GlobalKey boxKey = GlobalKey();

  Offset newPos = Offset.zero;

  Offset boxPos = Offset.zero;

  Offset difPos = Offset.zero;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox box = boxKey.currentContext?.findRenderObject() as RenderBox;
      setState(() {
        boxPos = box.localToGlobal(Offset.zero);
      });
    });
    super.initState();
  }

  void _updateBoxLocation(PointerEvent details) {
    setState(() {
      newPos = Offset(
          details.position.dx - difPos.dx, details.position.dy - difPos.dy);
    });
  }

  _onDown(PointerEvent details) {
    setState(() {
      _getPosition(details);
    });
  }

  void _getPosition(PointerEvent details) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        RenderBox box = boxKey.currentContext?.findRenderObject() as RenderBox;
        setState(() {
          boxPos = box.localToGlobal(Offset.zero);
          difPos = Offset(
              details.position.dx - boxPos.dx, details.position.dy - boxPos.dy);
        });
      });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: boxKey,
      left: newPos.dx,
      top: newPos.dy,
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Listener(
              onPointerMove: _updateBoxLocation,
              onPointerDown: _onDown,
              child: Container(
                height: 30,
                width: 100,
                color: Colors.amber,
              ),
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
