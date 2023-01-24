import 'package:flutter/foundation.dart';

class ValuesProvider with ChangeNotifier {
  String value = 'ff0000';
  int shades = 10;
  int index = 5;
  bool fullScale = false;

  double scale = 1.0;
  String getValue() => value;
  int getShades() => shades;
  int getIndex() => index;
  bool getFullScale() => fullScale;
  double getScale() => scale;

  void setValue(String newValue) {
    value = newValue;
    notifyListeners();
    print(value);
  }

  void setShades(int newShades) {
    shades = newShades;
    notifyListeners();
  }

  void setIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }

  void setFullScale(bool newFullScale) {
    fullScale = newFullScale;
    notifyListeners();
    print(fullScale);
  }

  void setScale(double newScale) {
    scale = newScale;
    notifyListeners();
  }
}
