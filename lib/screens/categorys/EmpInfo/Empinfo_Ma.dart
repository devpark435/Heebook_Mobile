import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heebook_application/main.dart';
import 'package:heebook_application/assets/Styles.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:url_launcher/url_launcher.dart';

class EmpInfo_Ma extends StatefulWidget {
  const EmpInfo_Ma({super.key});

  @override
  State<EmpInfo_Ma> createState() => _EmpInfo_MaState();
}

class _EmpInfo_MaState extends State<EmpInfo_Ma> {
  List<Notice> notices = [];
  Future getsociologyData() async {
    final url = Uri.parse(
        'https://www.wanted.co.kr/wdlist/530?country=kr&job_sort=company.response_rate_order&years=0&locations=all');
    final reponse = await http.get(url);

    dom.Document html = dom.Document.html(reponse.body);

    final titles = html
        .querySelectorAll(
            '#__next > div.JobList_cn__t_THp > div > div > div.List_List_container__JnQMS > ul.clearfix > li')
        .map((e) => e.innerHtml.trim())
        .toList();

    print('Count : ${titles.length}');

    for (final title in titles) {
      debugPrint(title);
    }
    setState(() {
      notices = List.generate(titles.length,
          (index) => Notice(url: '', title: titles[index], img: ''));
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
          title: Text("마케팅"),
        ),
        body: Container());
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
