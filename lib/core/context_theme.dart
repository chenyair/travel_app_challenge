import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextTheme on BuildContext {
  TextStyle get bodyText1 {
    return Theme.of(this).textTheme.bodyText1!;
  }

  TextStyle get subtitle1 {
    return Theme.of(this).textTheme.subtitle1!;
  }

  TextStyle get headline2 {
    return Theme.of(this).textTheme.headline2!;
  }

  TextStyle get headline6 {
    return Theme.of(this).textTheme.headline6!;
  }
}
