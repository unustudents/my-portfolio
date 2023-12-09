import 'package:flutter/material.dart';

class HeaderModel {
  final String title;
  final VoidCallback onTap;
  final bool isButton;

  HeaderModel(
      {required this.title, required this.onTap, this.isButton = false});
}
