import 'package:flutter/material.dart';

class ColorManager {
  static Color deepPrimary = HexColor.fromHex('#ffc300');
  static Color slowPrimary = HexColor.fromHex('#ffd60a');
  static Color iconColor = HexColor.fromHex('#000814');
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    hexString = hexString.replaceAll('#', '');
    if (hexString.length == 6) {
      hexString = 'ff' + hexString;
    }
    return Color(int.parse(hexString, radix: 16));
  }
}
