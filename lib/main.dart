import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/app_localizations.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const EclatApp());
}

class EclatApp extends StatefulWidget {
  const EclatApp({super.key});

  @override
  State<EclatApp> createState() => _EclatAppState();
}

class _EclatAppState extends State<EclatApp> {
  static const _languagePreferenceKey = 'selected_language';
  static const _supportedLanguages = {'fr', 'en', 'ar'};
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  Locale _locale = const Locale('fr');

  @override
  void initState() {
    super.initState();
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final languageCode = preferences.getString(_languagePreferenceKey);
      if (!mounted ||
          languageCode == null ||
          !_supportedLanguages.contains(languageCode)) {
        return;
      }
      setState(() => _locale = Locale(languageCode));
    } catch (error) {
      debugPrint('Could not load the saved language preference: $error');
    }
  }

  Future<void> _selectLocale(Locale locale) async {
    setState(() => _locale = locale);
    final context = _scaffoldMessengerKey.currentContext;
    final saveError = context == null
        ? null
        : AppLocalizations.of(context)?.languageSaveError;
    try {
      final preferences = await SharedPreferences.getInstance();
      await preferences.setString(_languagePreferenceKey, locale.languageCode);
    } catch (error) {
      debugPrint('Could not save the language preference: $error');
      if (mounted && saveError != null) {
        _scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(content: Text(saveError)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const ink = Color(0xFF24352D);
    const background = Color(0xFFF7F3EB);

    return MaterialApp(
      scaffoldMessengerKey: _scaffoldMessengerKey,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: const [
        Locale('fr'),
        Locale('en'),
        Locale('ar'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC8754D),
          surface: background,
          onSurface: ink,
        ),
        fontFamily: 'serif',
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
        ),
      ),
      home: HomeScreen(onLocaleChanged: _selectLocale),
    );
  }
}
