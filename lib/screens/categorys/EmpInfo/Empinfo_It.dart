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
  List<String> empInfoCompany = [];
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
        empInfoCompany = webScraper
            .getElementTitle('div.content > div > div.area_corp > strong > a');
        //document.querySelector("#recruit_info_list > div.content > div:nth-child(1) > div.area_corp > strong > a")
        //2 1
      });
      // print(empInfoTitle);

    }
  }
  /**사람인 크롤링 데이터  */

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
      resizeToAvoidBottomInset: true,
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
                  scrollDirection: Axis.vertical,
                  itemCount: empInfoTitle!.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Attributes are in the form of List<Map<String, dynamic>>.
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 100,
                      child: Card(
                        elevation: 5,
                        surfaceTintColor: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Container(
                                width: 75,
                                height: 75,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.amber),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 250,
                                  height: 60,
                                  alignment: Alignment.topLeft,
                                  // color: Colors.amber,
                                  child: Text(
                                    empInfoCompany[index].replaceAll(" ", ""),
                                    style: Styles.mainText,
                                  ),
                                ),
                                Container(
                                    width: 250,
                                    height: 20,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text(
                                      empInfoTitle[index],
                                      // style: Styles.subText,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })),
    );
  }
}
