import 'package:flutter/material.dart';
import 'package:imitate_sirloin/appbar/baseappbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  final String title = '검색';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appBar: AppBar(), title: title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '검색\n공사중',
            ),
          ],
        ),
      ),
    );
  }
}