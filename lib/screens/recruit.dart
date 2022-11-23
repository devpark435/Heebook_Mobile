import 'package:flutter/material.dart';
import 'package:heebook_application/main.dart';
import 'recruit.dart';

class RecruitPage extends StatefulWidget {
  const RecruitPage({super.key, required this.title});
  final String title;
  @override
  State<RecruitPage> createState() => _RecruitPageState();
}

class _RecruitPageState extends State<RecruitPage> {
  String search = '';
  var items = List<String>.generate(50, (i) => "ItemName $i");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 75,
                        child: TextField(
                          onChanged: (value) {
                            search = value;
                          },
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 0.9,
              //     height: 100,
              //     decoration: BoxDecoration(
              //         color: Colors.green,
              //         borderRadius: BorderRadius.circular(15)),
              //   ),
              // )
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: items! == null ? 0 : items.length,
                    itemBuilder: ((context, index) {
                      var itemDatas = items![index];
                      return SizedBox(
                        height: 100,
                        child: Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                        ),
                      );
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
