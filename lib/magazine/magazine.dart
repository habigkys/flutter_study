import 'package:flutter/material.dart';
import 'package:imitate_sirloin/appbar/baseappbar.dart';

class MagazinePage extends StatelessWidget {
  const MagazinePage({super.key});

  final String title = '매거진';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appBar: AppBar(), title: title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '매거진',
            ),
          ],
        ),
      ),
    );
  }
}