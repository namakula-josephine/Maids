import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class Maidcle extends StatefulWidget {
  const Maidcle({super.key});

  @override
  State<Maidcle> createState() => _MaidcleState();
}

class _MaidcleState extends State<Maidcle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgColor,
    );
  }
}