import 'package:flutter/material.dart';
import 'package:heebook_application/main.dart';
import 'package:heebook_application/assets/Styles.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class EmpInfo_Sa extends StatefulWidget {
  const EmpInfo_Sa({super.key});

  @override
  State<EmpInfo_Sa> createState() => _EmpInfo_SaState();
}

class _EmpInfo_SaState extends State<EmpInfo_Sa> {
  List<List<Map<String, dynamic>>> list = [];
  List<Map<String, dynamic>> keywords = [];
  List<String> empInfoSaTitle = [];
  Future fetch() async {
    http.Response infoURL =
        await http.get(Uri.parse('https://career.programmers.co.kr/job'));

    dom.Document document = parser.parse(infoURL.body);
    var keywordElements = document.querySelectorAll('.item-body');

    for (var i in keywordElements) {
      var name = i.querySelector('a.position-link')!.attributes['href'];
      keywords.add({'title': name});

      list.add(keywords);
    }
    print('$keywordElements hi');
    return list;
  }

  @override
  void initState() {
    super.initState();
    // Requesting to fetch before UI drawing starts
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("사회"),
        ),
        body: Container(
          child: Text(''),
        ));
  }
}
