import 'package:flutter/material.dart';
import 'package:heebook_application/main.dart';
import 'package:heebook_application/assets/Styles.dart';
import 'package:heebook_application/screens/categorys/EmpInfo/Empinfo_Sa.dart';
import './EmpInfo/Empinfo_It.dart';
import 'EmpInfo/Empinfo_Ma.dart';

class EmpInfo extends StatefulWidget {
  const EmpInfo({super.key});

  @override
  State<EmpInfo> createState() => _EmpInfoState();
}

class _EmpInfoState extends State<EmpInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: ctgContaner(context, 'IT융합자율학부', '소프트웨어, 컴퓨터공학'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => EmpInfo_IT())));
                  },
                ),
                GestureDetector(
                  child: ctgContaner(context, '사회융합', '사복, 사과'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => EmpInfo_Sa())));
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: ctgContaner(context, '마케팅 테스트', '사복, 사과'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => EmpInfo_Ma())));
                  },
                ),
                ctgContaner(context, 'mainText', 'subText')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
