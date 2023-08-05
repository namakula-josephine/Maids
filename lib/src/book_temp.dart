import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
             
             Gap(50),
            Container(
              padding:  const EdgeInsets.symmetric(horizontal:25 , vertical: 45),
              child: Column(
                children: [
                  Gap(10),
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset("assets/laundry.jpg",
                        height: 80,
                      
                        ),
                      ),
                      Gap(130),
                      Container(
                        padding: const EdgeInsets.symmetric( vertical: 5),
                        decoration: BoxDecoration(
                        ),
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset("assets/clean.jpg",
                                height: 80,),
                            ),
                            Text('Cleaning',style: Styles.headlineStyle5),
                          ],
                        ),
                      ),

                    ],
                  ),
                Container(
                   child: Icon(
                   EvaIcons.shoppingCart, // Specify the cart icon here
                   size: 95, // Adjust the size as needed
                   color: Colors.black, // Choose the desired color for the icon
                   
                 ),),
                 
                ],
              ),
            ),

          ],
        )),
    );
  }
}