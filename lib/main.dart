import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imitate_sirloin/controllers/AppController.dart';
import 'package:imitate_sirloin/firebase_options.dart';
import 'package:imitate_sirloin/home/home.dart';
import 'package:imitate_sirloin/category/category.dart';
import 'package:imitate_sirloin/link/dynamiclink.dart';
import 'package:imitate_sirloin/magazine/magazinelist.dart';
import 'package:imitate_sirloin/my/my.dart';
import 'package:imitate_sirloin/search/search.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future requestPermission() async {
  NotificationSettings settings = await _messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  var fcmToken = await FirebaseMessaging.instance.getToken(vapidKey: "BNUUSlqrxujsOKVF3k8J2L1PsCq-9QchcwTlT5LiR8RrDyX-IpjZSoAt8d5KGJVqh-1CqufNksmVbBNCZvZBSZA");
  DynamicLink().setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = '설로인 따라하기';

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
  final AppController c = Get.put(AppController());

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
  );

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const CategoryPage(),
    const SearchPage(),
    const MagazineListPage(),
    const MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: c.initialize(),
        builder: (context, snapshot) {
          if(snapshot.hasData && snapshot.connectionState == ConnectionState.done){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('title', style: TextStyle(fontSize: 20)),
                  Text('message', style: TextStyle(fontSize: 15)),
                ],
              ));
          }else{
            return SafeArea(
              child: _widgetOptions.elementAt(_selectedIndex),
            );
          }
        },
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
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
