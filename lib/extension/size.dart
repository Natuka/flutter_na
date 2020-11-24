import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void initSize(BuildContext context,
    {double width = 750, double height = 1334, bool allowFontScaling = false}) {
  ScreenUtil.init(context,
      designSize: Size(width, height), allowFontScaling: allowFontScaling);
}

extension NumberScreenSize on num {
  double get w => SizeCached().width(this);
  double get h => SizeCached().height(this);
  double get f => SizeCached().font(this);
}

class SizeCached {
  Map<num, num> widthCached = new Map<num, num>();
  Map<num, num> heightCached = new Map<num, num>();
  Map<num, num> fontCached = new Map<num, num>();
  static SizeCached instance = SizeCached._();

  factory SizeCached() {
    return instance;
  }

  removeAll() {
    widthCached.clear();
    heightCached.clear();
    fontCached.clear();
  }

  num width(num size) {
    if (widthCached.containsKey(size)) {
      return widthCached[size];
    }

    return widthCached[size] = ScreenUtil().setWidth(size);
  }

  num height(num size) {
    if (heightCached.containsKey(size)) {
      return heightCached[size];
    }

    return heightCached[size] = ScreenUtil().setHeight(size);
  }

  num font(num size) {
    if (fontCached.containsKey(size)) {
      return fontCached[size];
    }

    return fontCached[size] = ScreenUtil().setSp(size);
  }

  SizeCached._();
}
