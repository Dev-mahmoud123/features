import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:tasky/presentation_layer/screens/custom_bottom_navigation_bar_screen/custom_bottom_nav_bar_screen.dart';
import 'package:tasky/presentation_layer/screens/local_notification_screen/local_notification_screen.dart';
import 'package:tasky/presentation_layer/widgets/language_drop_down_menu.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'title'.tr() + ':',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  'app_local_demo'.tr(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Text(
                'details'.tr() + ':',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  'demo_details'.tr(),
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),

          /// TODO : Language drop down button
          const LanguageDropDownMenu(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const LocalNotificationScreen(),
                  ));
            },
            child: Text(
              'go_second_screen'.tr(),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const CustomBottomNavigationBarScreen(),
                  ));
            },
            child: Text(
              'go_third_screen'.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
