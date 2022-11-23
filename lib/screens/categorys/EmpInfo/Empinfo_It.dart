import 'package:flutter/material.dart';
import 'package:heebook_application/main.dart';
import 'package:heebook_application/assets/Styles.dart';
import 'package:web_scraper/web_scraper.dart';

class EmpInfo_IT extends StatefulWidget {
  const EmpInfo_IT({super.key});

  @override
  State<EmpInfo_IT> createState() => _EmpInfo_ITState();
}

class _EmpInfo_ITState extends State<EmpInfo_IT> {
  List<String> empInfoTitle = [];
  // initialize WebScraper by passing base url of website
  final webScraper = WebScraper('https://career.programmers.co.kr');

  void fetchProducts() async {
    // Loads web page and downloads into local state of library
    if (await webScraper.loadWebPage('/job')) {
      setState(() {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        empInfoTitle = webScraper.getElementTitle(
          //채용공고 타이틀 스크랩
          //document.querySelector("#list-positions-wrapper > ul > li:nth-child(1) > div.item-body > div.position-title-wrapper > h5 > a")
          '#list-positions-wrapper > ul > li > div.item-body > div.position-title-wrapper > h5 > a',
        );

        //2 1
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Requesting to fetch before UI drawing starts
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IT"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: empInfoTitle == null ? 0 : empInfoTitle.length,
            itemBuilder: ((context, index) {
              if (empInfoTitle.length == 0) {
                return Center(child: Text('Null'));
              } else {
                return Container(
                  height: 100,
                  child: Card(
                    child: Text(empInfoTitle[index]),
                  ),
                );
              }
            })),
      ),
    );
  }
}
