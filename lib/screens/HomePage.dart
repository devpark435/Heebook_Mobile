import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:heebook_application/main.dart';
import 'package:heebook_application/screens/categorys/EmpInfo.dart';
import 'recruit.dart';
import '../assets/Styles.dart';
import '../screens/categorys/EmpInfo.dart';

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
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              height: 100,
              child: Text(
                "Categorys",
                style: Styles.headerText,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: ctgContaner(
                      context, '취업 / 공모전', '학과, 학부별\n관련 취업, 공모전 뉴스'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => EmpInfo())));
                  },
                ),
                ctgContaner(context, 'mainText', 'subText')
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ctgContaner(context, 'mainText', 'subText'),
                ctgContaner(context, 'mainText', 'subText')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
