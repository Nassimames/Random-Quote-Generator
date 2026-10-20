// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Éclat — citations inspirantes';

  @override
  String get headerTagline => 'VOTRE PARENTHÈSE';

  @override
  String get eyebrow => 'UN INSTANT POUR SOI';

  @override
  String get headline => 'Une belle pensée\nchange tout.';

  @override
  String get subtitle => 'Laissez ces quelques mots éclairer votre journée.';

  @override
  String get quoteToKeep => 'UNE PENSÉE À GARDER';

  @override
  String get newQuote => 'Une autre citation';

  @override
  String get copyQuote => 'Copier la citation';

  @override
  String get quoteCopied => 'Citation copiée dans le presse-papiers';

  @override
  String get footer => 'Un peu de lumière, chaque jour.';

  @override
  String get chooseLanguage => 'Choisir la langue';

  @override
  String get languageSaveError =>
      'La langue a changé, mais votre choix n’a pas pu être enregistré.';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageArabic => 'العربية';
}
