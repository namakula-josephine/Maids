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
          backgroundColor: Colors.white,
          title: Text(
            "MAID MATCH",
            style: Styles.headlineStyl,
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        backgroundColor: Styles.backgColor,
    );
  }
}
