import 'package:flutter/widgets.dart';

extension StringExtension on String {
  Text get text {
    return Text(this);
  }

  TextSpan get textSpan {
    return TextSpan(text: this);
  }
}
