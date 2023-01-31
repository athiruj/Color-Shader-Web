class Ratio {
  double maxHeight;
  double maxWidth;
  static const designHeight = 840;
  static const designWidth = 1800;

  Ratio({
    required this.maxHeight,
    required this.maxWidth,
  });

  double get heightRatio => maxHeight / designHeight;
  double get widthRatio => maxWidth / designWidth;

  double get tablet => heightRatio * 1040;
  double get header => heightRatio * 44;
  double get contr => widthRatio * 640;
  double get box => heightRatio * 112.8;
  double get footer => heightRatio * 54;

  double get margin => heightRatio * 28;
}
