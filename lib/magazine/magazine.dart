import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:imitate_sirloin/main.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:imitate_sirloin/appbar/depthappbar.dart';
import 'package:imitate_sirloin/model/magazineModel.dart';

import '../link/dynamiclink.dart';


class MagazinePage extends StatelessWidget {
  const MagazinePage({super.key, required this.id});

  final int id;
  final String title = '매거진';

  @override
  Widget build(BuildContext context) {
    MagazineModel magazineModel = MagazineModel(
        1, "무슨 냄새 안 나요?\n치즈 향 품은 드라이에이징 고기", "분명 고기를 먹는데 치즈 향이 후각과 미각을 자극한다. 향의 비밀을 알아보자.",
        "2022.11.22", "<div><h1>1번 글 HTML임</h1><p>This is a <strong>paragraph</strong>.</p><p>I like <i>dogs</i></p><p style='color: red, font-size: 20px'>Red text</p><ul><li>List item 1</li><li>List item 2</li><li>List item 3</li></ul><img style='width: 300, height: 200' src='https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg' /></div>"
    );
    switch(id){
      case 1:
        magazineModel = MagazineModel(
            1, "무슨 냄새 안 나요?\n치즈 향 품은 드라이에이징 고기", "분명 고기를 먹는데 치즈 향이 후각과 미각을 자극한다. 향의 비밀을 알아보자.",
            "2022.11.22", "<div><h1>1번 글 HTML임</h1><p>This is a <strong>paragraph</strong>.</p><p>I like <i>dogs</i></p><p style='color: red, font-size: 20px'>Red text</p><ul><li>List item 1</li><li>List item 2</li><li>List item 3</li></ul><img style='width: 300, height: 200' src='https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg' /></div>"
        );
        break;
      case 2:
        magazineModel = MagazineModel(
            2, "숙성人류, 누가 시작 했을까?", "숙성의 맛, 고대로부터 흘러오다.",
            "2022.11.22", "<div><h1>2번 글 HTML임</h1><p>This is a <strong>paragraph</strong>.</p><p>I like <i>dogs</i></p><p style='color: red, font-size: 20px'>Red text</p><ul><li>List item 1</li><li>List item 2</li><li>List item 3</li></ul><img style='width: 300, height: 200' src='https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg' /></div>"
        );
        break;
      case 3:
        magazineModel = MagazineModel(
            3, "철판 요리를 일본 코스에 녹이다,\n이상철 셰프", "고객에게 섬세하게 마음을 쓰는\n텟판야키 산고쇼 이상철 셰프를 만났다.",
            "2022.11.22", "<div><h1>3번 글 HTML임</h1><p>This is a <strong>paragraph</strong>.</p><p>I like <i>dogs</i></p><p style='color: red, font-size: 20px'>Red text</p><ul><li>List item 1</li><li>List item 2</li><li>List item 3</li></ul><img style='width: 300, height: 200' src='https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg' /></div>"
        );
        break;
      case 4:
        magazineModel = MagazineModel(
            4, "안심의 숨겨진 매력, 아시나요?", "부드러울 뿐 아니라 쫄깃 쫀득하죠",
            "2022.11.22", "<div><h1>4번 글 HTML임</h1><p>This is a <strong>paragraph</strong>.</p><p>I like <i>dogs</i></p><p style='color: red, font-size: 20px'>Red text</p><ul><li>List item 1</li><li>List item 2</li><li>List item 3</li></ul><img style='width: 300, height: 200' src='https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg' /></div>"
        );
        break;
      case 5:
        magazineModel = MagazineModel(
            5, "첸트로다움이 만든 차이,\n도웅희 셰프", "서울 파스타 맛집 첸트로가\n코스 요리 레스토랑으로 도약했다.",
            "2022.11.22", "<div><h1>5번 글 HTML임</h1><p>This is a <strong>paragraph</strong>.</p><p>I like <i>dogs</i></p><p style='color: red, font-size: 20px'>Red text</p><ul><li>List item 1</li><li>List item 2</li><li>List item 3</li></ul><img style='width: 300, height: 200' src='https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg' /></div>"
        );
        break;
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          toolbarHeight: 50.0,
          elevation: 0.0,
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          centerTitle: false,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.black,
              onPressed: () {
                if(Navigator.canPop(context)){
                  Navigator.pop(context);
                }else{
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                }
              }
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.share),
              color: Colors.black,
              onPressed: () async {
                Share.share(
                  await DynamicLink().getShortLink(
                    'magazine',
                    id,
                  ),
                );
              }
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ListView(
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