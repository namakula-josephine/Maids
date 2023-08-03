import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:maidmatch_app/src/rotate_icon.dart';

import '../utils/app_styles.dart';

class bookpage1 extends StatefulWidget {
  const bookpage1({super.key});

  @override
  State<bookpage1> createState() => _bookpage1State();
}

class _bookpage1State extends State<bookpage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text("MAID MATCH", style: Styles.headlineStyle, textAlign:TextAlign.center,),
              leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
            ),
      backgroundColor: Styles.backgColor,
      body: SafeArea(
        child: ListView(
          children: [
             
             Gap(100),
             RevolvingIconsWidget(),
          ],
        )),
    );
  }
}