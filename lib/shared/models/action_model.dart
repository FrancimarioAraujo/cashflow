import 'package:flutter/material.dart';

class ActionModel {
  String title;
  VoidCallback onTap;

  ActionModel({
    required this.title,
    required this.onTap,
  });
}
