import 'package:flutter/material.dart';
import 'package:imitate_sirloin/appbar/baseappbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String title = 'Sir.LOIN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appBar: AppBar(), title: title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Sir.LOIN\n공사중',
            ),
          ],
        ),
      ),
    );
  }
}