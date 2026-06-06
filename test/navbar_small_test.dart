import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  group('NavBarSmall', () {
    final items = <NavBarItem>[
      NavBarItem(text: 'Home'),
      NavBarItem(text: 'About'),
      NavBarItem(text: 'Contact'),
    ];

    testWidgets('shows a menu icon by default (collapsed)', (tester) async {
      await tester.pumpWidget(_wrap(NavBarSmall(navBarItems: items)));

      expect(find.byIcon(Icons.menu), findsOneWidget);
      // Items must not be visible until the popup is opened.
      expect(find.text('Home'), findsNothing);
      expect(find.text('About'), findsNothing);
    });

    testWidgets('opens a PopupMenu when the menu icon is tapped',
        (tester) async {
      await tester.pumpWidget(_wrap(NavBarSmall(navBarItems: items)));

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      expect(find.byType(PopupMenuItem<dynamic>), findsNWidgets(items.length));
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('Contact'), findsOneWidget);
    });

    testWidgets('handles empty item list without throwing', (tester) async {
      await tester.pumpWidget(_wrap(const NavBarSmall(navBarItems: [])));

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      expect(find.byType(PopupMenuItem<dynamic>), findsNothing);
    });

    testWidgets('tapping an item inside the menu invokes its onTap',
        (tester) async {
      var taps = 0;
      final tappableItems = [
        NavBarItem(text: 'Home', onTap: () => taps++),
        NavBarItem(text: 'About'),
      ];

      await tester.pumpWidget(_wrap(NavBarSmall(navBarItems: tappableItems)));
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();

      expect(taps, 1);
    });
  });
}
