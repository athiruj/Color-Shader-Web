import 'package:color_shader/color_shader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValuesProvider with ChangeNotifier {
  String value = 'ff0000';
  int shades = 10;
  int index = 5;
  bool fullScale = false;

  double scale = 100;
  String getValue() => value;
  int getShades() => shades;
  int getIndex() => index;
  double getScale() => scale;

  void setValue(String newValue) {
    value = newValue;
    notifyListeners();
    palette;
    lightPalette;
    darkPalette;
    // print(value);
  }

  void setShades(int newShades) {
    shades = newShades;
    notifyListeners();
    palette;
    lightPalette;
    darkPalette;
  }

  void setIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
    palette;
    lightPalette;
    darkPalette;
  }

  void setFullScale(bool newFullScale) {
    fullScale = newFullScale;
    notifyListeners();
    print(fullScale);
    palette;
    lightPalette;
    darkPalette;
  }

  void setScale(double newScale) {
    scale = newScale;
    notifyListeners();
    palette;
    lightPalette;
    darkPalette;
  }

  List<Color> palette(){
  return (
    Shader(int.parse('0xff$value'),
              shades: shades,
              index: index,
              fullScale: fullScale)
          .palette(scale: scale / 100)
          
  );}
  List<Color> lightPalette(){
  return (
    Shader(int.parse('0xff$value'),
              shades: shades,
              index: index,
              fullScale: fullScale)
          .lightPalette(scale: scale / 100)
          
  );}
  List<Color> darkPalette(){
  return (
    Shader(int.parse('0xff$value'),
              shades: shades,
              index: index,
              fullScale: fullScale)
          .darkPalette(scale: scale / 100)
          
  );}
}
