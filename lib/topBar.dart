import 'dart:ui';

import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50,
      right: -50,
      child: Image.asset(
        'images/pokeball.png',
        //height: 50,
        width: 200,
        fit: BoxFit.fitWidth,
        color: Colors.black,
      ),
    );
  }
}
