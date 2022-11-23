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
  // List<Map<String, dynamic>>? empInfoTitle;
  // initialize WebScraper by passing base url of website
  // final webScraper = WebScraper('https://career.programmers.co.kr/');

  // void fetchProducts() async {
  //   // Loads web page and downloads into local state of library
  //   if (await webScraper.loadWebPage('job')) {
  //     setState(() {
  //       // getElement takes the address of html tag/element and attributes you want to scrap from website
  //       // it will return the attributes in the same order passed
  //       empInfoTitle = webScraper.getElement(
  //           //채용공고 타이틀 스크랩
  //           //document.querySelector("#list-positions-wrapper > ul > li:nth-child(1) > div.item-body > div.position-title-wrapper > h5 > a")
  //           ////*[@id="list-positions-wrapper"]/ul/li[1]/div[2]/div[1]/h5/a
  //           //ul.list-positions>li.list-position-item>div.item-body > div.position-title-wrapper> h5.position-title > a.position-link
  //           'div.position-title-wrapper>h5.position-title > a.position-link',
  //           ['href']);

  //       //2 1
  //     });
  //     print(empInfoTitle);
  //   }
  // }
  final webScraper = WebScraper('https://www.saramin.co.kr/');
  void fetchProducts() async {
    if (await webScraper.loadWebPage(
        'zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=search&searchword=it')) {
      setState(() {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        empInfoTitle = webScraper.getElementTitle(
            //채용공고 타이틀 스크랩
            //document.querySelector("#list-positions-wrapper > ul > li:nth-child(1) > div.item-body > div.position-title-wrapper > h5 > a")
            ////*[@id="list-positions-wrapper"]/ul/li[1]/div[2]/div[1]/h5/a
            //ul.list-positions>li.list-position-item>div.item-body > div.position-title-wrapper> h5.position-title > a.position-link
            'div.area_job > h2 > a > span');

        //2 1
      });
      print(empInfoTitle);
    }
  }

//document.querySelector("#recruit_info_list > div.content > div:nth-child(1) > div.area_job > h2 > a > span")
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
      body: SafeArea(
          child: empInfoTitle == null
              ? Center(
                  child:
                      CircularProgressIndicator(), // Loads Circular Loading Animation
                )
              : ListView.builder(
                  itemCount: empInfoTitle!.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Attributes are in the form of List<Map<String, dynamic>>.
                    return ExpansionTile(
                      title: Text(empInfoTitle[index]),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                        )
                      ],
                    );
                  })),
    );
  }
}
