import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:maidmatch_app/src/b_perm.dart';
import 'package:maidmatch_app/src/book_temp.dart';

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
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 45),
            children: [
              Text(
                "Help us know what you're looking for!",
                style: Styles.headlineStyle2,
                textAlign: TextAlign.center,
              ),
              Gap(70),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => bPerm1()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(),
                    color: Colors.white,
                  ),
                  width: 100,
                  height: 100,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/maid.jpg",
                        height: 60,
                      ),
                      Image.asset(
                        "assets/perm.jpg",
                        height: 60,
                      ),
                      Text(
                        "PERMANENT",
                        style: Styles.headlineStyle3,
                      ),
                    ],
                  ),
                ),
              ),
              Gap(50),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => bookpage1()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(),
                    color: Colors.white,
                  ),
                  width: 100,
                  height: 100,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/maid.jpg",
                        height: 50,
                      ),
                      Image.asset(
                        "assets/temp.jpg",
                        height: 50,
                      ),
                      Text(
                        "TEMPORARY",
                        style: Styles.headlineStyle3,
                      ),
                    ],
                  ),
                ),
              ),
            ]));
  }
}
