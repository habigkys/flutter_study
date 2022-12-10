import 'package:flutter/material.dart';

class DepthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DepthAppBar({required this.appBar, required this.title});

  final AppBar appBar;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text(title),
          toolbarHeight: 50.0,
          elevation: 0.0,
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          centerTitle: false,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.shopping_cart),
                color: Colors.black,
                onPressed: () {
                  print('shopping cart button is clicked');
                }
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}