import 'package:flutter/material.dart';

Decoration get defaultDecoration {
  return BoxDecoration(
    color: Colors.white,
    border: Border.all(
      width: 0.6,
      color: Colors.grey[300]!,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    boxShadow: [
      BoxShadow(
        color: Color(0x19000000),
        blurRadius: 8,
        offset: Offset(0, 6),
      ),
    ],
  );
}
