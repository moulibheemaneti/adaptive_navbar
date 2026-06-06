import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  group('NavBarItem', () {
    testWidgets('renders its text', (tester) async {
      await tester.pumpWidget(_wrap(NavBarItem(text: 'Home')));
      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('is an InkWell so it can ripple/tap', (tester) async {
      final item = NavBarItem(text: 'About');
      await tester.pumpWidget(_wrap(item));
      // NavBarItem extends InkWell — verify the type hierarchy rather than
      // relying on find.byType (which matches exact runtimeType only).
      expect(item, isA<InkWell>());
      expect(find.byType(NavBarItem), findsOneWidget);
    });

    testWidgets('fires onTap when tapped', (tester) async {
      var taps = 0;
      await tester.pumpWidget(
        _wrap(NavBarItem(text: 'Contact', onTap: () => taps++)),
      );

      await tester.tap(find.byType(NavBarItem));
      await tester.pump();

      expect(taps, 1);
    });

    testWidgets('does not throw when onTap is null', (tester) async {
      await tester.pumpWidget(_wrap(NavBarItem(text: 'Docs')));
      await tester.tap(find.byType(NavBarItem));
      await tester.pump();
      expect(tester.takeException(), isNull);
    });

    testWidgets('exposes the text via the public field', (tester) async {
      final item = NavBarItem(text: 'Pricing');
      expect(item.text, 'Pricing');
    });
  });
}
