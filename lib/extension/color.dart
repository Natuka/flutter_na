import 'dart:ui';
import "dart:core";

import 'package:flutter/widgets.dart';

extension ColorExtension on String {
  Color get hex {
    return hexColor(this);
  }

  Color get rgb {
    return ColorParser().parseRgb(this);
  }

  Color get color {
    return ColorParser().parse(this);
  }

  Color get rgba {
    return ColorParser().parseRgba(this);
  }

  Color get hls {
    return ColorParser().parseHsl(this);
  }
}

Color hexColor(String color) {
  if (color.contains('#')) {
    color = color.substring(1);
  }

  if (color.length == 3) {
    color += color;
  }

  if (color.length == 6) {
    color = 'ff' + color;
  }

  return Color(int.parse(color, radix: 16));
}

class ColorParser {
  static final RegExp _beginsHash = new RegExp("^#");
  static final RegExp _hexColorRegExp = new RegExp("^#?([\\da-fA-F]{6})\$");
  static final RegExp _hexColorAbbreviatedRegExp =
      new RegExp("^#?([\\da-fA-F]{3})\$");
  static final RegExp _rgbColorImplicitRegExp =
      new RegExp("^(\\d{1,3})\\s*,\\s*(\\d{1,3})\\s*,\\s*(\\d{1,3})\$");
  static final RegExp _rgbColorExplicitRegExp = new RegExp(
      "^rgb\\(\\s*(\\d{1,3})\\s*,\\s*(\\d{1,3})\\s*,\\s*(\\d{1,3})\\s*\\)\$");

  static final RegExp _rgbaColorImplicitRegExp = new RegExp(
      "^(\\d{1,3})\\s*,\\s*(\\d{1,3})\\s*,\\s*(\\d{1,3})\\s*,\\s*(\\d+(\\.\\d*)?|\\.\\d+)\\s*\\)\$");
  static final RegExp _rgbaColorExplicitRegExp = new RegExp(
      "^rgb\\(\\s*(\\d{1,3})\\s*,\\s*(\\d{1,3})\\s*,\\s*(\\d{1,3})\\s*\\,\\s*(\\d+(\\.\\d*)?|\\.\\d+)\\s*\\)\$");

  static final RegExp _hslColorRegExp = new RegExp(
      "^hsl\\(\\s*(\\d{1,3})\\s*,\\s*(\\d+(\\.\\d*)?|\\.\\d+)%\\s*,\\s*(\\d+(\\.\\d*)?|\\.\\d+)%\\s*\\)\$");

  static final ColorParser instance = ColorParser._();

  factory ColorParser() {
    return instance;
  }

  ColorParser._();

  Color parse(String toParse, {Color orElse()}) {
    toParse = toParse.trim();
    return parseRgb(toParse) ??
        parseRgba(toParse) ??
        parseHex(toParse) ??
        parseHsl(toParse) ??
        // parseNamed(toParse) ??
        orElse?.call() ??
        null;
  }

  Color parseHex(String toParse) {
    if (_hexColorRegExp.hasMatch(toParse)) {
      return hexColor(toParse);
    }

    if (_hexColorAbbreviatedRegExp.hasMatch(toParse)) {
      String _unAbbreviated = new String.fromCharCodes(toParse
          .replaceFirst(_beginsHash, "")
          .codeUnits
          .map((c) => [c, c])
          .expand((c) => c));
      return hexColor(_unAbbreviated);
    }

    return null;
  }

  Color parseHsl(String toParse) {
    if (_hslColorRegExp.hasMatch(toParse)) {
      Match match = _hslColorRegExp.allMatches(toParse).first;

      return HSLColor.fromAHSL(
              1.0,
              double.parse(match.group(1)),
              double.parse(match.group(2) ?? match.group(3)),
              double.parse(match.group(4) ?? match.group(5)))
          .toColor();
    }

    return null;
  }

  Color parseRgb(String toParse) {
    if (_rgbColorImplicitRegExp.hasMatch(toParse)) {
      Match match = _rgbColorImplicitRegExp.allMatches(toParse).first;

      var r = int.parse(match.group(1));
      var g = int.parse(match.group(2));
      var b = int.parse(match.group(3));
      return Color.fromARGB(255, r, g, b);
    }

    if (_rgbColorExplicitRegExp.hasMatch(toParse)) {
      Match match = _rgbColorExplicitRegExp.allMatches(toParse).first;
      var r = int.parse(match.group(1));
      var g = int.parse(match.group(2));
      var b = int.parse(match.group(3));
      return Color.fromARGB(255, r, g, b);
    }

    return null;
  }

  Color parseRgba(String toParse) {
    if (_rgbaColorImplicitRegExp.hasMatch(toParse)) {
      Match match = _rgbaColorImplicitRegExp.allMatches(toParse).first;

      var r = int.parse(match.group(1));
      var g = int.parse(match.group(2));
      var b = int.parse(match.group(3));
      return Color.fromARGB(255, r, g, b);
    }

    if (_rgbaColorExplicitRegExp.hasMatch(toParse)) {
      Match match = _rgbaColorExplicitRegExp.allMatches(toParse).first;
      var r = int.parse(match.group(1));
      var g = int.parse(match.group(2));
      var b = int.parse(match.group(3));
      return Color.fromARGB(255, r, g, b);
    }

    return null;
  }

  // Color parseNamed(String toParse) {
  //   try {
  //     return new RgbColor.name(toParse.toLowerCase());
  //   } catch (argumentError) {
  //     return null;
  //   }
  // }
}
