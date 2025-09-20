import 'package:flutter/material.dart';

extension PaddingExtension on num {
  Widget get vertical => SizedBox(height: toDouble());
  Widget get horizontal => SizedBox(width: toDouble());
  EdgeInsets get all => EdgeInsets.all(toDouble());
  EdgeInsets get verticalSymmetric => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get horizontalSymmetric => EdgeInsets.symmetric(horizontal: toDouble());
}
