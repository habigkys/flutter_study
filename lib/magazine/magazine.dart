import 'package:flutter/material.dart';
import 'package:imitate_sirloin/appbar/baseappbar.dart';
import 'package:imitate_sirloin/model/magazineListModel.dart';

class MagazinePage extends StatelessWidget {
  const MagazinePage({super.key, required this.arguments});

  final MagazineListModel arguments;
  final String title = '매거진';

  @override
  Widget build(BuildContext context) {
    print(this.arguments.id);
    return Scaffold(
      appBar: BaseAppBar(appBar: AppBar(), title: title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '매거진 페이지',
            ),
          ],
        ),
      ),
    );
  }
}