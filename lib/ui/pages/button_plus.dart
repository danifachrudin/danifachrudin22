import 'package:flutter/material.dart';

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  final double offsetX;
  final double offsetY;

  CustomFloatingActionButtonLocation({this.offsetX = 0, this.offsetY = 0});

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    double x = offsetX;
    double y = -offsetY; // Negatif untuk menggeser ke atas

    return Offset(x, y);
  }

  @override
  String toString() => 'FloatingActionButtonLocation.custom';
}
