import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
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
      body:ListView(
          padding: const EdgeInsets.symmetric(horizontal:25 , vertical: 45),
          children: [
                        InkWell(
              onTap: (){},
              child: Image.asset("assets/perm.jpg",
                  height: 250,),
            ),
          ]
    ));
  }
}