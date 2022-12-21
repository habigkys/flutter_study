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
      _redirectScreen(dynamicLinkData);
    }).onError((error) {
    });
  }

  void _redirectScreen(PendingDynamicLinkData dynamicLinkData) {
    if (dynamicLinkData.link.queryParameters.containsKey('id')) {
      print('dynamicLinkData : ${dynamicLinkData}');
      String link = dynamicLinkData.link.path.split('/').last;
      print('link : ${link}');
      int id = dynamicLinkData.link.queryParameters['id']! as int;
      print('id : ${id}');

      switch (link) {
        case 'magazine':
          Get.offAll(
                () => MagazinePage(
              id: id,
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
        packageName: 'magazine',
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'magazine',
        minimumVersion: '0',
      ),
    );
    final dynamicLink =
    await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    return dynamicLink.shortUrl.toString();
  }
}