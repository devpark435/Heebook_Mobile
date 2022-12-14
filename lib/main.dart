import 'package:flutter/material.dart';
import 'screens/HomePage.dart';
import 'screens/open.dart';
import 'screens/recruit.dart';
import 'assets/Styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const BottomNav(),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    RecruitPage(title: "title"),
    RecruitPage(title: "title"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 메인 위젯
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '모집',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: '내 정보',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void initState() {
    //해당 클래스가 호출되었을떄
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

Widget ctgContaner(context, mainText, subText) {
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width * 0.45,
    height: 250,
    decoration: BoxDecoration(
        color: Colors.amber, borderRadius: BorderRadius.circular(25)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Container(
            child: Text(
              mainText,
              style: Styles.mainText,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            subText,
            style: Styles.subText,
          ),
        )
      ],
    ),
  );
}
