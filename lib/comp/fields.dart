import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/app_styles.dart';

class textfield extends StatefulWidget {
  const textfield({super.key});

  @override
  State<textfield> createState() => _textfieldState();
}

class _textfieldState extends State<textfield> {
  @override
  Widget build(BuildContext context) {
    return               Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                 color: const Color(0xFFD9D9D9),
                 borderRadius: BorderRadius.circular(18),
                 border: Border.all(
                      color: Colors.deepPurpleAccent
                    ),
                ),
                child: Text(
                        'select number of tickets', 
                        style: Styles.headlineStyle4,
                      ),
                padding: const EdgeInsets.all(20),
              );
  }
}