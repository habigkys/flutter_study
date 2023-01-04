import 'package:flutter/material.dart';
import 'package:imitate_sirloin/webview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String title = 'Sir.LOIN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Webview(initialUrl: 'https://blog.leaphop.co.kr/blogs'),
    );
  }
}