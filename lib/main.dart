import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tasky/data_layer/web_service/notification_services.dart';
import 'package:tasky/presentation_layer/screens/language_screen/language_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  NotificationService().init();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      /// Get List of supported locales
      supportedLocales: context.supportedLocales,
      /// Get current locale
      locale: context.locale,
      home: const LanguageScreen(),
    );
  }
}
