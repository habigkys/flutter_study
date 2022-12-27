import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () {
          Navigator.pop(context);
        },
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: ListView(
          children: [
            Container(
                padding: const EdgeInsets.only(bottom: 30),
                child: const Text('서비스 이용을 위해\n로그인이 필요합니다.', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold))),
            // SizedBox(height: 20, width: double.infinity),
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(padding: const EdgeInsets.all(0), onPressed: () {}, icon: Image.asset('images/naver_button.png'), iconSize: 70,),
                  IconButton(padding: const EdgeInsets.all(0), onPressed: () async {
                    bool isInstalled = await isKakaoTalkInstalled();

                    OAuthToken token = isInstalled
                        ? await UserApi.instance.loginWithKakaoTalk()
                        : await UserApi.instance.loginWithKakaoAccount();
                    final url = Uri.https('kapi.kakao.com', '/v2/user/me');

                    final response = await get(
                      url,
                      headers: {
                        HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
                      },
                    );

                    final profileInfo = json.decode(response.body);
                    print("카카오 로그인 프로필 인포: ${profileInfo.toString()}");
                  }, icon: Image.asset('images/kakao_button.png'), iconSize: 70),
                  IconButton(padding: const EdgeInsets.all(0), onPressed: () {}, icon: Image.asset('images/apple_button.jpeg'), iconSize: 70),
                  IconButton(padding: const EdgeInsets.all(0), onPressed: () {}, icon: Image.asset('images/sirloin_button.png'), iconSize: 70),
                ],
              ),
            ),
            Container(
                width: double.infinity,
                color: Colors.white,
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.only(bottom: 40),
                child: IconButton(
                  // padding 제거
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Image.asset('images/advertise_square.png'),
                  iconSize: 350,
                  onPressed: () {},
                )
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {  },
                child: const Text('비회원 주문기록을 보고싶으신가요?', style: TextStyle(color: Colors.grey, decoration: TextDecoration.underline),),
              ),
            )
          ],
        ),
      ),
    );
  }
}