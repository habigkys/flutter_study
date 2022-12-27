import 'package:flutter/material.dart';
import 'package:imitate_sirloin/appbar/baseappbar.dart';
import 'package:imitate_sirloin/video.dart';

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
          children: <Widget>[
            Video(videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
          ],
        ),
      ),
    );
  }
}