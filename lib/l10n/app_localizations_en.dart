// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Eclat — inspiring quotes';

  @override
  String get headerTagline => 'A MOMENT FOR YOU';

  @override
  String get eyebrow => 'A MOMENT FOR YOURSELF';

  @override
  String get headline => 'A beautiful thought\nchanges everything.';

  @override
  String get subtitle => 'Let these few words brighten your day.';

  @override
  String get quoteToKeep => 'A THOUGHT TO KEEP';

  @override
  String get newQuote => 'Another quote';

  @override
  String get copyQuote => 'Copy quote';

  @override
  String get quoteCopied => 'Quote copied to clipboard';

  @override
  String get footer => 'A little light, every day.';

  @override
  String get chooseLanguage => 'Choose language';

  @override
  String get languageSaveError =>
      'Your language changed, but your choice could not be saved.';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageArabic => 'العربية';
}
