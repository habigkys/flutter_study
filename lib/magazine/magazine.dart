import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:imitate_sirloin/appbar/depthappbar.dart';
import 'package:imitate_sirloin/model/magazineModel.dart';

class MagazinePage extends StatelessWidget {
  const MagazinePage({super.key, required this.id});

  final int id;
  final String title = '매거진';

  @override
  Widget build(BuildContext context) {
    MagazineModel magazineModel = MagazineModel(
        id, "무슨 냄새 안 나요?\n치즈 향 품은 드라이에이징 고기", "분명 고기를 먹는데 치즈 향이 후각과 미각을 자극한다. 향의 비밀을 알아보자.",
        "2022.11.22", "<div><h1>‘미트탐구생활’은 알아 두면 쓸모 있는 고기 지식을 알기 쉽게 풀어내는 콘텐츠입니다.</h1><p>This is a <strong>paragraph</strong>.</p><p>I like <i>dogs</i></p><p style='color: red, font-size: 20px'>Red text</p><ul><li>List item 1</li><li>List item 2</li><li>List item 3</li></ul><img style='width: 300, height: 200' src='https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg' /></div>"
    );

    return Scaffold(
      appBar: DepthAppBar(appBar: AppBar()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                      child: Text(magazineModel.mainTitle,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.fromSTEB(20.0, 0, 20.0, 0),
                      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0, 20.0, 0),
                      child: Text(magazineModel.subTitle,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.fromSTEB(20.0, 0, 20.0, 0),
                      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0, 20.0, 0),
                      child: Html(
                        data: magazineModel.contents,
                        style: {
                          'h1': Style(color: Colors.red),
                          'p': Style(color: Colors.black87, fontSize: FontSize.medium),
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}