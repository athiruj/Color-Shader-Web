import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class ThisColorContainer extends StatelessWidget {
  const ThisColorContainer(
      {super.key,
      required this.color,
      required this.text,
      this.defaultValue = false});

  final Color color;

  final String text;

  final bool defaultValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // width: double.maxFinite,
        color: color,
        child: TextButton(
          onPressed: () async {
            await Clipboard.setData(ClipboardData(text: text));
            AlertController.show("Copied", "Copy Success!", TypeAlert.success);
          },
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.black.withOpacity(0.1);
            }
            return color;
          })),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                defaultValue
                    ? Icon(
                        Remix.star_fill,
                        size: 28,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 16,
                ),
                RotatedBox(
                    quarterTurns: 1,
                    child: Container(
                      width: 80,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Text(
                        text,
                        style: GoogleFonts.openSans(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
