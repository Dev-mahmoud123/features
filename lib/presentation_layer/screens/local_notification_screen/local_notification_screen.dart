import 'package:flutter/material.dart';
import 'package:tasky/data_layer/web_service/notification_services.dart';
import 'controller.dart';

class LocalNotificationScreen extends StatelessWidget {
  const LocalNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(145, 131, 222, 1),
            Color.fromRGBO(160, 148, 227, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const AnimatedLogo(),
                const SizedBox(
                  height: 50.0,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Local\nNotification',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  child: TextButton.icon(
                    onPressed: () {
                      NotificationService().showNotification();
                    },
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Simple Notification',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  child: TextButton.icon(
                    onPressed: () {
                      NotificationService().scheduleLNotification();
                    },
                    icon: const Icon(
                      Icons.notifications_active,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Scheduled Notification',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  child: TextButton.icon(
                    onPressed: () {
                      NotificationService().cancelNotification();
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Remove Notification',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
