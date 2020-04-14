import 'dart:ui';

import 'package:flutter/material.dart';

extension RadiusExtension on num {
  Radius get radius {
    return Radius.circular(this.toDouble());
  }

  BorderRadius get borderRadius {
    return BorderRadius.circular(this.toDouble());
  }

  BorderRadius get borderRadiusTlr {
    return BorderRadius.only(
      topLeft: this.radius,
      topRight: this.radius,
    );
  }

  BorderRadius get borderRadiusBlr {
    return BorderRadius.only(bottomLeft: this.radius, bottomRight: this.radius);
  }
}
