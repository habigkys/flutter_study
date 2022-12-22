import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:imitate_sirloin/magazine/magazine.dart';
import 'package:uni_links/uni_links.dart';

class DynamicLink {
  Future<bool> setup() async {
    bool isExistDynamicLink = await _getInitialDynamicLink();
    _addListener();

    return isExistDynamicLink;
  }

  Future<bool> _getInitialDynamicLink() async {
    final String? deepLink = await getInitialLink();

    if (deepLink != null) {
      PendingDynamicLinkData? dynamicLinkData = await FirebaseDynamicLinks
          .instance
          .getDynamicLink(Uri.parse(deepLink));

      if (dynamicLinkData != null) {
        _redirectScreen(dynamicLinkData);

        return true;
      }
    }

    return false;
  }

  void _addListener() {
    FirebaseDynamicLinks.instance.onLink.listen((
        PendingDynamicLinkData dynamicLinkData,
        ) {
      print('dynamicLinkData : ${dynamicLinkData}');
      print('queryParam is there?? : ${dynamicLinkData.link.queryParameters['id']}');
      _redirectScreen(dynamicLinkData);
    }).onError((error) {
    });
  }

  void _redirectScreen(PendingDynamicLinkData dynamicLinkData) {
    if (dynamicLinkData.link.queryParameters.containsKey('id')) {
      String link = dynamicLinkData.link.path.split('/').last;
      var id = dynamicLinkData.link.queryParameters['id'];

      switch (link) {
        case 'magazine':
          Get.offAll(
                () => MagazinePage(
              id: int.parse(id!),
            ),
          );
          break;
      }
    }
  }

  Future<String> getShortLink(String screenName, int id) async {
    String dynamicLinkPrefix = 'https://imitatesirloin.page.link';
    final dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: dynamicLinkPrefix,
      link: Uri.parse('$dynamicLinkPrefix/$screenName?id=$id'),
      androidParameters: const AndroidParameters(
        packageName: 'com.sirloin.imitate_sirloin',
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'magazine',
        minimumVersion: '0',
      ),
    );

    print('build Link!!! : ${dynamicLinkParams}');
    final dynamicLink =
    await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    return dynamicLink.shortUrl.toString();
  }
}