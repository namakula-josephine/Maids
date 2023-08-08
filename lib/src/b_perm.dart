import 'package:flutter/material.dart';
import 'package:maidmatch_app/src/check.dart';
import '../utils/app_styles.dart';
import 'package:maidmatch_app/comp/custom_button.dart';
import 'package:gap/gap.dart';

class bPerm1 extends StatefulWidget {
  const bPerm1({Key? key}) : super(key: key);

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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Give us your maids\n description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'PERMANENT MAIDS ARE\n AVAILABLE AT ONLY UGX 400,000\n PAID MONTHLY TO\n MAIDMATCH.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText:
                        'Type your maid description\n here to get your match.....',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                child: const Text(
                  'NOTE: This process takes\n two weeks to find your\n match and a 20% deposit\n is made if your match is\n found.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              Gap(50),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: customButton(text: "Login", onPressed: () => Checkout()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
