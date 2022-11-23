import 'package:flutter/material.dart';
import 'package:heebook_application/main.dart';
import 'package:heebook_application/assets/Styles.dart';
import './EmpInfo/Empinfo_It.dart';

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
