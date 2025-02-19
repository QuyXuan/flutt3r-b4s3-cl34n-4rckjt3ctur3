import 'package:flutter/material.dart';


extension BuildContextX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  bool get isTablet => MediaQuery.of(this).size.width >= 600.0;
}
