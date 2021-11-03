import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasky/data_layer/web_service/url_laubcher_service.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherWidget extends StatefulWidget {
  const UrlLauncherWidget({Key? key}) : super(key: key);

  @override
  State<UrlLauncherWidget> createState() => _UrlLauncherWidgetState();
}

class _UrlLauncherWidgetState extends State<UrlLauncherWidget> {
  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://www.cylog.org/headers/';
    const String phone = '01150198689';
    const String email = 'dancamdev@example.com';
    const String sms = '01150198689';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              UrlLauncherServices().launcherInBrowser(toLaunch);
            },
            child: const Text('Launch with browser'),
          ),
          ElevatedButton(
            onPressed: () {
              UrlLauncherServices().launchInWebViewOrSafariVC(toLaunch);
            },
            child: const Text('Launch in app'),
          ),
          ElevatedButton(
            onPressed: () {
              UrlLauncherServices().launchInWebViewWithJavaScript(toLaunch);
            },
            child: const Text('Launch in app (java script on)'),
          ),
          ElevatedButton(
            onPressed: () {
              UrlLauncherServices().launchInWebViewWithDomStorage(toLaunch);
            },
            child: const Text('Launch in app (Dom Storage on)'),
          ),
          ElevatedButton(
            onPressed: () {
              UrlLauncherServices().launchUniversalLinkIos(toLaunch);
            },
            child: const Text(
                'Launch a universal link in a native app, fallback to Safari.(Youtube)'),
          ),
          ElevatedButton(
            onPressed: () {
              UrlLauncherServices().launchInWebViewOrSafariVC(toLaunch);
              Timer(const Duration(seconds: 5), () {
                log('Closing web view after 5 seconds..');
                closeWebView();
              });
            },
            child: const Text('Launch in app + close after 5 seconds'),
          ),
          ElevatedButton(
              onPressed: () {
                UrlLauncherServices().makePhoneCall('tel:$phone');
              },
              child: const Text('Make Phone Call')),
          ElevatedButton(
              onPressed: () {
                UrlLauncherServices().makePhoneCall('sms:$phone');
              },
              child: const Text('Send SMS Message')),
          ElevatedButton(
              onPressed: () {
                UrlLauncherServices().sendEmail(email);
              },
              child: const Text('Send Email')),
          Link(
              uri: Uri.parse(
                  'https://pub.dev/documentation/url_launcher/latest/link/link-library.html'),
              target: LinkTarget.blank,
              builder: (context, openLink) {
                return TextButton.icon(onPressed: openLink,
                  label: const Text('Link Widget Documentation'),
                icon: const Icon(Icons.read_more),);
              })
        ],
      ),
    );
  }
}
