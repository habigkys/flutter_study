import 'package:flutter/material.dart';
import 'package:imitate_sirloin/home.dart';
import 'package:imitate_sirloin/category.dart';
import 'package:imitate_sirloin/magazine.dart';
import 'package:imitate_sirloin/my.dart';
import 'package:imitate_sirloin/search.dart';

void main() {
  runApp(const MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = '설로인 따라하기';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
  );

  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Category(),
    const Search(),
    const Magazine(),
    const My(),
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
            icon: Icon(Icons.category),
            label: '카테고리',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet),
            label: '매거진',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '마이',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
        selectedItemColor: Colors.indigo,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
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
