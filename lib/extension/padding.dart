import 'package:flutter/rendering.dart';

extension EdgeInsetsExtension<T extends num> on T {
  EdgeInsets get e {
    return EdgeInsets.all(this.toDouble());
  }

  EdgeInsets get elr {
    return EdgeInsets.symmetric(horizontal: this.toDouble());
  }

  EdgeInsets get etb {
    return EdgeInsets.symmetric(vertical: this.toDouble());
  }

  EdgeInsets get et {
    return EdgeInsets.only(top: this.toDouble());
  }

  EdgeInsets get el {
    return EdgeInsets.only(left: this.toDouble());
  }

  EdgeInsets get er {
    return EdgeInsets.only(right: this.toDouble());
  }

  EdgeInsets get eb {
    return EdgeInsets.only(bottom: this.toDouble());
  }
}
