import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherServices {
  /// TODO: launcher In Browser
  Future<void> launcherInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Can not launch $url';
    }
  }

  /// TODO: launch In WebView Or SafariVC
  Future<void> launchInWebViewOrSafariVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Can not launch $url';
    }
  }

  /// TODO: launch In WebView With JavaScript
  Future<void> launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Can not launch $url';
    }
  }

  /// TODO: launch In WebView With DomStorage
  Future<void> launchInWebViewWithDomStorage(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableDomStorage: true,
      );
    } else {
      throw 'Can not launch $url';
    }
  }

  // TODO: launch Universal Link Ios
  Future<void> launchUniversalLinkIos(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchedSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchedSucceeded) {
        await launch(
          url,
          forceSafariVC: true,
        );
      }
    }
  }

  /// TODO : launch Status
  Widget launchStatus( BuildContext context ,AsyncSnapshot<void> snapshot){
    if(snapshot.hasError){
      return Text('Error: ${snapshot.error}');
    }else{
      return const Text('');
    }
  }

  /// TODO : make Phone Call
  Future<void> makePhoneCall(String url)async{
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Can launch $url';
    }
  }

  void sendEmail(String email) => launch("mailto:$email");

}
