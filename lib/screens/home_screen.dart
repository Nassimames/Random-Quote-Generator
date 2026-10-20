import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/quotes.dart';
import '../l10n/app_localizations.dart';
import '../models/quote.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.onLocaleChanged, super.key});

  final ValueChanged<Locale> onLocaleChanged;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random _random = Random();
  late int _quoteIndex;

  QuoteTranslation get _quote =>
      quotes[_quoteIndex].forLanguage(Localizations.localeOf(context).languageCode);

  @override
  void initState() {
    super.initState();
    _quoteIndex = _random.nextInt(quotes.length);
  }

  void _showAnotherQuote() {
    setState(() {
      final nextIndex = _random.nextInt(quotes.length - 1);
      _quoteIndex = nextIndex >= _quoteIndex ? nextIndex + 1 : nextIndex;
    });
  }

  Future<void> _copyQuote(AppLocalizations localizations) async {
    final quotationMarks = Localizations.localeOf(context).languageCode == 'ar'
        ? ('“', '”')
        : ('« ', ' »');
    await Clipboard.setData(
      ClipboardData(
        text: '${quotationMarks.$1}${_quote.text}${quotationMarks.$2} — ${_quote.author}',
      ),
    );
    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(localizations.quoteCopied)));
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final quoteFontSize = screenWidth < 380 ? 25.0 : 30.0;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight - 40),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildHeader(localizations),
                        const SizedBox(height: 48),
                        _buildIntroduction(localizations),
                        const SizedBox(height: 32),
                        _buildQuoteCard(quoteFontSize),
                        const SizedBox(height: 24),
                        _buildQuoteMeta(localizations),
                        const SizedBox(height: 24),
                        _buildActions(localizations),
                        const SizedBox(height: 30),
                        _buildFooter(localizations),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations localizations) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFFE9DED0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(
            Icons.wb_sunny_rounded,
            color: Color(0xFFC8754D),
            size: 23,
          ),
        ),
        const SizedBox(width: 11),
        const Text(
          'éclat',
          style: TextStyle(
            color: Color(0xFF24352D),
            fontSize: 25,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.1,
          ),
        ),
        const Spacer(),
        Text(
          localizations.headerTagline,
          style: const TextStyle(
            color: Color(0xFF887E70),
            fontFamily: 'sans-serif',
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(width: 8),
        PopupMenuButton<Locale>(
          key: const Key('language-selector'),
          tooltip: localizations.chooseLanguage,
          onSelected: widget.onLocaleChanged,
          icon: const Icon(
            Icons.language_rounded,
            color: Color(0xFF24352D),
          ),
          itemBuilder: (context) => [
            CheckedPopupMenuItem(
              value: const Locale('fr'),
              checked: Localizations.localeOf(context).languageCode == 'fr',
              child: Text(localizations.languageFrench),
            ),
            CheckedPopupMenuItem(
              value: const Locale('en'),
              checked: Localizations.localeOf(context).languageCode == 'en',
              child: Text(localizations.languageEnglish),
            ),
            CheckedPopupMenuItem(
              value: const Locale('ar'),
              checked: Localizations.localeOf(context).languageCode == 'ar',
              child: Text(localizations.languageArabic),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIntroduction(AppLocalizations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.eyebrow,
          style: const TextStyle(
            color: Color(0xFFC8754D),
            fontFamily: 'sans-serif',
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 13),
        Text(
          localizations.headline,
          style: const TextStyle(
            color: Color(0xFF24352D),
            fontSize: 43,
            height: 1.12,
            fontWeight: FontWeight.w600,
            letterSpacing: -1.8,
          ),
        ),
        const SizedBox(height: 13),
        Text(
          localizations.subtitle,
          style: const TextStyle(
            color: Color(0xFF625C52),
            fontFamily: 'sans-serif',
            fontSize: 14,
            height: 1.5,
            letterSpacing: 0.1,
          ),
        ),
      ],
    );
  }

  Widget _buildQuoteCard(double quoteFontSize) {
    final quote = _quote;
    final quoteText = Localizations.localeOf(context).languageCode == 'ar'
        ? '“${quote.text}”'
        : '« ${quote.text} »';

    return Container(
      key: const Key('quote-card'),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFF24352D),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF24352D).withValues(alpha: 0.12),
            blurRadius: 26,
            offset: const Offset(0, 13),
          ),
        ],
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            end: -21,
            bottom: -62,
            child: Icon(
              Icons.auto_awesome_rounded,
              size: 185,
              color: Colors.white.withValues(alpha: 0.035),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(27, 25, 27, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.format_quote_rounded,
                      color: Color(0xFFD8916D),
                      size: 34,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.09),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        quote.category,
                        style: const TextStyle(
                          color: Color(0xFFF0C5AA),
                          fontFamily: 'sans-serif',
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 17),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 280),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.08),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: Column(
                    key: ValueKey(quote.text),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quoteText,
                        key: const Key('quote-text'),
                        style: TextStyle(
                          color: const Color(0xFFF7F3EB),
                          fontSize: quoteFontSize,
                          height: 1.3,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.55,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 1,
                            color: const Color(0xFFD8916D),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              quote.author,
                              key: const Key('quote-author'),
                              style: const TextStyle(
                                color: Color(0xFFE3C7B5),
                                fontFamily: 'sans-serif',
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuoteMeta(AppLocalizations localizations) {
    return Row(
      children: [
        const Icon(
          Icons.auto_awesome_rounded,
          color: Color(0xFFC8754D),
          size: 15,
        ),
        const SizedBox(width: 8),
        Text(
          localizations.quoteToKeep,
          style: const TextStyle(
            color: Color(0xFF887E70),
            fontFamily: 'sans-serif',
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        const Spacer(),
        Text(
          '${(_quoteIndex + 1).toString().padLeft(2, '0')} / ${quotes.length}',
          style: const TextStyle(
            color: Color(0xFF887E70),
            fontFamily: 'sans-serif',
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildActions(AppLocalizations localizations) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 58,
            child: FilledButton.icon(
              key: const Key('new-quote-button'),
              onPressed: _showAnotherQuote,
              icon: const Icon(Icons.refresh_rounded, size: 21),
              label: Text(
                localizations.newQuote,
                style: const TextStyle(
                  fontFamily: 'sans-serif',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFC8754D),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 58,
          height: 58,
          child: OutlinedButton(
            key: const Key('copy-quote-button'),
            onPressed: () => _copyQuote(localizations),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF24352D),
              side: const BorderSide(color: Color(0xFFE1D8CB)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Icon(
              Icons.content_copy_rounded,
              size: 19,
              semanticLabel: localizations.copyQuote,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(AppLocalizations localizations) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.favorite_rounded,
          size: 13,
          color: const Color(0xFFC8754D).withValues(alpha: 0.8),
        ),
        const SizedBox(width: 7),
        Text(
          localizations.footer,
          style: const TextStyle(
            color: Color(0xFF887E70),
            fontFamily: 'sans-serif',
            fontSize: 12,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}
