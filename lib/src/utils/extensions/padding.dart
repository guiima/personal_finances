import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget paddingAll(double value) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }

  Widget paddingHorizontal(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  Widget paddingVertical(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  Widget paddingTop(double value) {
    return Padding(padding: EdgeInsets.only(top: value), child: this);
  }

  Widget paddingBottom(double value) {
    return Padding(padding: EdgeInsets.only(bottom: value), child: this);
  }

  Widget paddingLeft(double value) {
    return Padding(padding: EdgeInsets.only(left: value), child: this);
  }

  Widget paddingRight(double value) {
    return Padding(padding: EdgeInsets.only(right: value), child: this);
  }

  Widget paddingLTRB(double left, double top, double right, double bottom) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }
}
