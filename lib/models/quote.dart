class Quote {
  const Quote({required this.translations});

  final Map<String, QuoteTranslation> translations;

  QuoteTranslation forLanguage(String languageCode) =>
      translations[languageCode] ?? translations['fr']!;
}

class QuoteTranslation {
  const QuoteTranslation({
    required this.text,
    required this.author,
    required this.category,
  });

  final String text;
  final String author;
  final String category;
}
