


import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);
const List<Color> _colorThemes = [
  _customColor,
  Color(0xFF5C11D4),
  Color(0xFFD4115C),
  Color(0xFF11D45C),
  Color(0xFFD4D411),
  Color(0xFF11D4D4),
  Colors.black,

];
class AppTheme {
  final int selectedColor;

  AppTheme({ this.selectedColor = 0}): assert(selectedColor >= 0 && selectedColor < _colorThemes.length, "Invalid color index selected for theme");
  
  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      // brightness: Brightness.dark

    );
  }

}