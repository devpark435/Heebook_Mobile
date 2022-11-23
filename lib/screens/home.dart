import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:heebook_application/main.dart';
import 'recruit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: double.maxFinite,
              height: 80,
              child: Text("Categorys"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ctgContaner(context, 'mainText', 'subText'),
                ctgContaner(context, 'mainText', 'subText')
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget ctgContaner(context, mainText, subText) {
  return Container(
    alignment: Alignment.centerLeft,
    width: MediaQuery.of(context).size.width * 0.45,
    height: 200,
    decoration: BoxDecoration(
        color: Colors.amber, borderRadius: BorderRadius.circular(25)),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
          ),
        ),
        Text(mainText),
        Text(subText)
      ],
    ),
  );
}
