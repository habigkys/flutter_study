import 'package:flutter/material.dart';
import 'package:imitate_sirloin/appbar/baseappbar.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  final String title = '마이페이지';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appBar: AppBar(), title: title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '마이페이지\n공사중',
            ),
          ],
        ),
      ),
    );
  }
}