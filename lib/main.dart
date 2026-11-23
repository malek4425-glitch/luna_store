import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'pages/splash_screen.dart';
import 'theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const LunaStore(),
    ),
  );
}

class LunaStore extends StatelessWidget {
  const LunaStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, currentTheme, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Luna Store',

          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: const Color(0xFFEDE6FF),
            primaryColor: const Color(0xFF8B5CF6),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF8B5CF6),
              brightness: Brightness.light,
            ),
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF17121F),
            primaryColor: const Color(0xFF8B5CF6),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF8B5CF6),
              brightness: Brightness.dark,
            ),
          ),

          themeMode: currentTheme,

          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          home: const SplashScreen(),
        );
      },
    );
  }
}
