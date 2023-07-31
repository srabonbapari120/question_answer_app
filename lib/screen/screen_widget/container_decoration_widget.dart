import 'package:flutter/material.dart';

class ContainerDecorationWidget {
  static final decuration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(0.8),
        offset: Offset(-6.0, -6.0),
        blurRadius: 16.0,
      ),
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        offset: Offset(6.0, 6.0),
        blurRadius: 16.0,
      ),
    ],
    color: Color(0xFFF5FAFD),
    borderRadius: BorderRadius.circular(12.0),
  );
}
