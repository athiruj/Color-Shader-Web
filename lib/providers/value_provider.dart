import 'package:color_shader/color_shader.dart';
import 'package:flutter/foundation.dart';

class ValuesProvider with ChangeNotifier {
  static const defaultValue = "FF0000";
  String value = "FF0000";
  int shades = 10;
  int index = 5;
  bool fullScale = false;
  double scale = 100;
  // String getValue() => value;
  // int getShades() => shades;
  // int getIndex() => index;
  // double getScale() => scale;

  void setValue(String newValue) {

    value = newValue;
    palette;
    lightPalette;
    darkPalette;
    notifyListeners();
  }

  void setShades(int newShades) {
    shades = newShades;
    index = newShades <= index ? (index/2).floor() : index;
    palette;
    lightPalette;
    darkPalette;
    notifyListeners();
  }

  void setIndex(int newIndex) {
    index = newIndex;
    palette;
    lightPalette;
    darkPalette;
    notifyListeners();
  }

  void setFullScale(bool newFullScale) {
    fullScale = newFullScale;
    palette;
    lightPalette;
    darkPalette;
    notifyListeners();
  }

  void setScale(double newScale) {
    scale = newScale;
    palette;
    lightPalette;
    darkPalette;
    notifyListeners();
  }

  List palette(){
  return (
    Shader(int.parse('0xff$value'),
              shades: shades,
              index: index,
              fullScale: fullScale)
          .palette(scale: scale / 100)
          
  );}
  List lightPalette(){
  return (
    Shader(int.parse('0xff$value'),
              shades: shades,
              index: index,
              fullScale: fullScale)
          .lightPalette(scale: scale / 100)
          
  );}
  List darkPalette(){
  return (
    Shader(int.parse('0xff$value'),
              shades: shades,
              index: index,
              fullScale: fullScale)
          .darkPalette(scale: scale / 100)
          
  );}
}
