import 'package:flutter/widgets.dart';

extension SizedBoxExtension<T extends num> on T {
  SizedBox get heightBox {
    return SizedBox(height: this.toDouble());
  }

  SizedBox get widthBox {
    return SizedBox(width: this.toDouble());
  }

  SizedBox get square {
    return SizedBox(
      width: this.toDouble(),
      height: this.toDouble(),
    );
  }
}
