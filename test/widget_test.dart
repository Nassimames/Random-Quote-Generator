import 'package:eclat/data/quotes.dart';
import 'package:eclat/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('opens with a quote and its author', (tester) async {
    await tester.pumpWidget(const EclatApp());

    expect(find.byKey(const Key('quote-card')), findsOneWidget);
    expect(find.byKey(const Key('quote-text')), findsOneWidget);
    expect(find.byKey(const Key('quote-author')), findsOneWidget);
    expect(find.text('Une autre citation'), findsOneWidget);
  });

  testWidgets('changes the interface language and reading direction', (
    tester,
  ) async {
    await tester.pumpWidget(const EclatApp());

    await tester.tap(find.byKey(const Key('language-selector')));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(CheckedPopupMenuItem<Locale>).at(1));
    await tester.pumpAndSettle();

    expect(find.text('Another quote'), findsOneWidget);
    expect(find.text('A THOUGHT TO KEEP'), findsOneWidget);

    await tester.tap(find.byKey(const Key('language-selector')));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(CheckedPopupMenuItem<Locale>).at(2));
    await tester.pumpAndSettle();

    expect(find.text('اقتباس آخر'), findsOneWidget);
    expect(find.text('كلمات تستحق أن تبقى'), findsOneWidget);
    expect(
      Directionality.of(
        tester.element(find.byKey(const Key('language-selector'))),
      ),
      TextDirection.rtl,
    );
    expect(
      (await SharedPreferences.getInstance()).getString('selected_language'),
      'ar',
    );

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpWidget(const EclatApp());
    await tester.pumpAndSettle();
    expect(find.text('اقتباس آخر'), findsOneWidget);
  });

  testWidgets('shows a different quote each time the button is tapped', (
    tester,
  ) async {
    await tester.pumpWidget(const EclatApp());

    var previousQuote = tester
        .widget<Text>(find.byKey(const Key('quote-text')))
        .data!;
    for (var i = 0; i < quotes.length; i++) {
      await tester.ensureVisible(find.byKey(const Key('new-quote-button')));
      await tester.tap(find.byKey(const Key('new-quote-button')));
      await tester.pumpAndSettle();
      final nextQuote = tester
          .widget<Text>(find.byKey(const Key('quote-text')))
          .data!;
      expect(nextQuote, isNot(previousQuote));
      previousQuote = nextQuote;
    }
  });
}
