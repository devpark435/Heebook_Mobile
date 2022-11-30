import 'package:flutter/material.dart';
import 'package:heebook_application/main.dart';
import 'package:heebook_application/assets/Styles.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:url_launcher/url_launcher.dart';

class EmpInfo_Sa extends StatefulWidget {
  const EmpInfo_Sa({super.key});

  @override
  State<EmpInfo_Sa> createState() => _EmpInfo_SaState();
}

class _EmpInfo_SaState extends State<EmpInfo_Sa> {
  List<Notice> notices = [];
  Future getsociologyData() async {
    final url = Uri.parse(
        'https://www.saramin.co.kr/zf_user/jobs/public/list?sort=ud&quick_apply=&show_applied=&search_day=&keyword=&pr_exp_lv%5B%5D=1&final_edu%5B%5D=3&up_cd%5B%5D=1&up_cd%5B%5D=4#listTop');
    final reponse = await http.get(url);
    dom.Document html = dom.Document.html(reponse.body);

    final titles = html
        .querySelectorAll(
            'td.notification_info > div.job_tit > a.str_tit > span') //#rec-44415891 > td.notification_info > div.job_tit > a.str_tit > span
        .map((e) => e.innerHtml.trim())
        .toList();
    final urls = html
        .querySelectorAll(
            'td.notification_info > div.job_tit > a.str_tit') //#rec-44415891 > td.notification_info > div.job_tit > a.str_tit > span
        .map((e) => 'https://www.saramin.co.kr/${e.attributes['href']}')
        .toList();

    print('Count : ${titles.length}');
    for (final title in titles) {
      debugPrint(title);
    }
    setState(() {
      notices = List.generate(titles.length,
          (index) => Notice(url: urls[index], title: titles[index], img: ''));
    });
  }

  @override
  void initState() {
    super.initState();
    getsociologyData();
    // Requesting to fetch before UI drawing starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("사회"),
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: notices.length,
            itemBuilder: ((context, index) {
              final notice = notices[index];
              return GestureDetector(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 80,
                    child: Card(child: Text(notice.title))),
                onTap: () {
                  launchUrlStart(url: "https://flutter.dev");
                },
              );
            })));
  }

  Future<void> launchUrlStart({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}

class Notice {
  final String? url;
  final String title;
  final String img;
  const Notice({
    required this.url,
    required this.title,
    required this.img,
  });
}
