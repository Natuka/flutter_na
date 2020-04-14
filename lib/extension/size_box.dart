import 'package:flutter/widgets.dart';

extension SizedBoxExtension on num {
  SizedBox get heightBox {
    return SizedBox(height: this.toDouble());
  }

  SizedBox get widthBox {
    return SizedBox(width: this.toDouble());
  }
}
