import 'package:flutter/rendering.dart';

extension PaddingExtension on num {
  EdgeInsets get p {
    return EdgeInsets.all(this);
  }

  EdgeInsets get plr {
    return EdgeInsets.symmetric(horizontal: this);
  }

  EdgeInsets get ptb {
    return EdgeInsets.symmetric(vertical: this);
  }

  EdgeInsets get pt {
    return EdgeInsets.only(top: this);
  }

  EdgeInsets get pl {
    return EdgeInsets.only(left: this);
  }

  EdgeInsets get pr {
    return EdgeInsets.only(right: this);
  }

  EdgeInsets get pb {
    return EdgeInsets.only(bottom: this);
  }
}
