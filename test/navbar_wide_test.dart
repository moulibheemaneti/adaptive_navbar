import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  group('NavBarWide', () {
    final items = <NavBarItem>[
      NavBarItem(text: 'Home'),
      NavBarItem(text: 'About'),
      NavBarItem(text: 'Contact'),
    ];

    testWidgets('renders all provided items as text', (tester) async {
      await tester.pumpWidget(_wrap(NavBarWide(navBarItems: items)));

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('Contact'), findsOneWidget);
    });

    testWidgets('renders one NavBarItem per entry', (tester) async {
      await tester.pumpWidget(_wrap(NavBarWide(navBarItems: items)));
      expect(find.byType(NavBarItem), findsNWidgets(items.length));
    });

    testWidgets('uses Row + Expanded so items share width', (tester) async {
      await tester.pumpWidget(_wrap(NavBarWide(navBarItems: items)));
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Expanded), findsNWidgets(items.length));
    });

    testWidgets('renders nothing when given an empty list', (tester) async {
      await tester.pumpWidget(_wrap(const NavBarWide(navBarItems: [])));
      expect(find.byType(NavBarItem), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('takes one-third of the available width', (tester) async {
      // Make the surface 900px wide so the math is easy to verify.
      tester.view.physicalSize = const Size(900, 600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(_wrap(NavBarWide(navBarItems: items)));

      final container = tester.widget<Container>(
        find.ancestor(
          of: find.byType(Row),
          matching: find.byType(Container),
        ),
      );

      expect(container.constraints?.maxWidth, 300); // 900 / 3
    });
  });
}
