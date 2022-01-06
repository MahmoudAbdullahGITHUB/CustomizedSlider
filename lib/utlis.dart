import 'dart:math';

import 'package:flutter/material.dart';

num degToRad(num deg) => deg * (pi / 180.0);

num normalize(value, min, max) => ((value - min) / (max - min));

const Color kScaffoldBackgroundColor = Color(0xFFF3FBFA);
const double kDiameter = 300;
const double kMinDegree = 0;
const double kMaxDegree = 180;

class Utils {
  static List<Widget> modelBuilder<M>(List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}
