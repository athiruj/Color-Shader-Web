
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThisColorContainer extends StatelessWidget {
  final Color color;
  final String? text;
  const ThisColorContainer({super.key,required this.color,this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: GestureDetector(
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: text));
        },
      ),
    );
  }
}