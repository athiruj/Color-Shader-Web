import 'package:flutter/material.dart';

/// [DragPoint] Widget is [DragTarget] Widget with fixed properties in some methods
///
/// Offset [position] is get position of parent widget when methods is activate

/// [DragPointDetails] extend [DragTargetDetails] with `position` property
class DragPointDetails extends DragTargetDetails {
  DragPointDetails(
      {required super.data, required super.offset, required this.position});

  /// [postion] of parent
  final Offset position;
}

/// entend typedef of [DragTargetAcceptWithDetail]
typedef DragPointAcceptWithDetail = void Function(DragPointDetails details);

/// entend typedef of [DragTargetMove]
typedef DragPointMove = void Function(DragPointDetails details);

/// [DragPoint] Widget is [DragTarget] with fixed
class DragPoint extends StatefulWidget {
  const DragPoint({
    super.key,
    required this.builder,
    this.onWillAccept,
    this.onAccept,
    this.onAcceptWithDetail,
    this.onMove,
    this.onLeave,
  });

  final DragTargetBuilder builder;

  final DragTargetWillAccept? onWillAccept;

  final DragTargetAccept? onAccept;

  final DragPointAcceptWithDetail? onAcceptWithDetail;

  final DragPointMove? onMove;

  final DragTargetLeave? onLeave;

  @override
  State<DragPoint> createState() => _DragPointState();
}

class _DragPointState extends State<DragPoint> {
  final GlobalKey pointKey = GlobalKey();

  Offset position = Offset.zero;

  @override
  void initState() {
    getPosition();
    super.initState();
  }

  /// [getPosition] get position of widget on screen
  void getPosition() => WidgetsBinding.instance.addPostFrameCallback((_) {
        RenderBox box =
            pointKey.currentContext?.findRenderObject() as RenderBox;
        setState(() {
          position = box.localToGlobal(Offset.zero);
        });
      });

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      key: pointKey,
      builder: widget.builder,
      onWillAccept: widget.onWillAccept,
      onAccept: widget.onAccept,
      onLeave: widget.onLeave,
      onAcceptWithDetails: (d) {
        getPosition();
        setState(() {
          widget.onAcceptWithDetail!(DragPointDetails(
              data: d.data, offset: d.offset, position: position));
        });
      },
      onMove: widget.onMove != null
          ? (d) => setState(() {
                getPosition();
                widget.onMove!(DragPointDetails(
                    data: d.data, offset: d.offset, position: position));
              })
          : null,
    );
  }
}
