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
        backgroundColor: Colors.orange,
        title: Text(
          "MAID MATCH",
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Styles.backgColor,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Center(
                    child: Text(
                      'Give us your maid\n description',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      'PERMANENT MAIDS ARE\n AVAILABLE AT ONLY UGX 400,000\n PAID MONTHLY TO\n MAIDMATCH.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 320,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText:
                          'Type your maid description here\nto get your match...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  child: const Text(
                    'NOTE: This process takes\ntwo weeks to find your\nmatch and a 20% deposit\nis made if your match is\nfound.',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(50),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child:
                      customButton(text: "SUBMIT", onPressed: () => checkout()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
