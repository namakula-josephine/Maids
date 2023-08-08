import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../utils/app_styles.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  List<String> selectedItems = []; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgColor,
      body: Container(
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
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: selectedItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            selectedItems[index], 
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.cancel, color: Colors.red),
                          onPressed: () {

                            setState(() {
                              selectedItems.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
