import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../utils/app_styles.dart';

class checkout extends StatefulWidget {
  const checkout({super.key});

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {

    final CollectionReference _laundry = 
  FirebaseFirestore.instance.collection('laundry');

  List<String> selectedItems = []; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgColor,
      body: StreamBuilder<Object>(
        stream: _laundry.snapshots(),
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 15) ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 223, 235, 235),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        width: 150,
                        height: 150,
                        child:LottieBuilder.asset("assets/cart.json",
                            height: 90,
                            width: 90,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'CHECK\nOUT\nORDER',
                          style: TextStyle(fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'TOTAL AMOUNT : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'UGX 50,000',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red, 
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              
              ],
            ),
          );
        }
      ),
    );
  }
}
