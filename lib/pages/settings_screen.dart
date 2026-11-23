import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'login_screen.dart';
import '../theme_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'en';

  @override
  void initState() {
    super.initState();
    _selectedLanguage =
        WidgetsBinding.instance.platformDispatcher.locale.languageCode == 'ar'
        ? 'ar'
        : 'en';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr()),
        backgroundColor: const Color(0xFF8B5CF6),
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'app_settings'.tr(),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Dark Mode
            Card(
              child: ValueListenableBuilder<ThemeMode>(
                valueListenable: themeModeNotifier,
                builder: (context, currentTheme, child) {
                  return SwitchListTile(
                    title: Text('dark_mode'.tr()),
                    subtitle: Text('enable_dark_theme'.tr()),
                    secondary: const Icon(
                      Icons.dark_mode_outlined,
                      color: Color(0xFF8B5CF6),
                    ),
                    value: currentTheme == ThemeMode.dark,
                    activeColor: const Color(0xFF8B5CF6),
                    onChanged: (value) {
                      themeModeNotifier.value = value
                          ? ThemeMode.dark
                          : ThemeMode.light;
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            // Language
            Card(
              child: ListTile(
                leading: const Icon(Icons.language, color: Color(0xFF8B5CF6)),
                title: Text('language'.tr()),
                subtitle: Text('choose_language'.tr()),
                trailing: DropdownButton<String>(
                  value: _selectedLanguage,
                  items: [
                    DropdownMenuItem(value: 'en', child: Text('english'.tr())),
                    DropdownMenuItem(value: 'ar', child: Text('arabic'.tr())),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedLanguage = value;
                      });

                      context.setLocale(Locale(value));
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              'account_settings'.tr(),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.person_outline,
                  color: Color(0xFF8B5CF6),
                ),
                title: Text('manage_account'.tr()),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('manage_account'.tr())),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // Logout
            Card(
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: Text(
                  'logout'.tr(),
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
