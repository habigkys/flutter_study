import 'package:flutter/material.dart';
import 'package:imitate_sirloin/appbar/baseappbar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  final String title = '카테고리';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appBar: AppBar(), title: title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '카테고리\n공사중',
            ),
          ],
        ),
      ),
    );
  }
}