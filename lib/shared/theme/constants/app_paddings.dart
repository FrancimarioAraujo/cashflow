import 'package:flutter/material.dart';

class AppPaddings {
  // Padding uniforme (todos os lados iguais)
  static const EdgeInsets none = EdgeInsets.all(0);
  static const EdgeInsets extraSmall = EdgeInsets.all(3.0);
  static const EdgeInsets small = EdgeInsets.all(8.0);
  static const EdgeInsets medium = EdgeInsets.all(16.0);
  static const EdgeInsets large = EdgeInsets.all(24.0);
  static const EdgeInsets extraLarge = EdgeInsets.all(32.0);

  // Padding horizontal (somente laterais)
  static const EdgeInsets horizontalExtraSmall = EdgeInsets.symmetric(horizontal: 3.0);
  static const EdgeInsets horizontalSmall = EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsets horizontalMedium = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets horizontalLarge = EdgeInsets.symmetric(horizontal: 24.0);
  static const EdgeInsets horizontalExtraLarge = EdgeInsets.symmetric(horizontal: 32.0);

  // Padding vertical (somente topo e base)
  static const EdgeInsets verticalExtraSmall = EdgeInsets.symmetric(vertical: 3.0);
  static const EdgeInsets verticalSmall = EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsets verticalMedium = EdgeInsets.symmetric(vertical: 16.0);
  static const EdgeInsets verticalLarge = EdgeInsets.symmetric(vertical: 24.0);
  static const EdgeInsets verticalExtraLarge = EdgeInsets.symmetric(vertical: 32.0);

  // Padding específico para cada lado
  static const EdgeInsets topSmall = EdgeInsets.only(top: 8.0);
  static const EdgeInsets topMedium = EdgeInsets.only(top: 16.0);
  static const EdgeInsets topLarge = EdgeInsets.only(top: 24.0);

  static const EdgeInsets bottomSmall = EdgeInsets.only(bottom: 8.0);
  static const EdgeInsets bottomMedium = EdgeInsets.only(bottom: 16.0);
  static const EdgeInsets bottomLarge = EdgeInsets.only(bottom: 24.0);

  static const EdgeInsets leftSmall = EdgeInsets.only(left: 8.0);
  static const EdgeInsets leftMedium = EdgeInsets.only(left: 16.0);
  static const EdgeInsets leftLarge = EdgeInsets.only(left: 24.0);

  static const EdgeInsets rightSmall = EdgeInsets.only(right: 8.0);
  static const EdgeInsets rightMedium = EdgeInsets.only(right: 16.0);
  static const EdgeInsets rightLarge = EdgeInsets.only(right: 24.0);
}
