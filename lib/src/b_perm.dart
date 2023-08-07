import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class bPerm1 extends StatefulWidget {
  const bPerm1({super.key});

  @override
  State<bPerm1> createState() => _bPerm1State();
}

class _bPerm1State extends State<bPerm1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            "MAID MATCH",
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Styles.backgColor,
    );
  }
}
