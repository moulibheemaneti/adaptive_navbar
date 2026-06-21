import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _hostWithAppBar(AdaptiveNavBar appBar) =>
    MaterialApp(home: Scaffold(appBar: appBar, body: const SizedBox.shrink()));

void main() {
  final items = <NavBarItem>[
    NavBarItem(text: 'Home'),
    NavBarItem(text: 'About'),
  ];

  group('AdaptiveNavBar — adaptive switching', () {
    testWidgets('renders NavBarSmall when screenWidth < 800', (tester) async {
      await tester.pumpWidget(
        _hostWithAppBar(
          AdaptiveNavBar(screenWidth: 500, navBarItems: items),
        ),
      );

      expect(find.byType(NavBarSmall), findsOneWidget);
      expect(find.byType(NavBarWide), findsNothing);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('renders NavBarWide when screenWidth >= 800', (tester) async {
      await tester.pumpWidget(
        _hostWithAppBar(
          AdaptiveNavBar(screenWidth: 1024, navBarItems: items),
        ),
      );

      expect(find.byType(NavBarWide), findsOneWidget);
      expect(find.byType(NavBarSmall), findsNothing);
      // Items rendered inline in wide mode.
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
    });

    testWidgets('boundary: exactly 800 renders the wide layout',
        (tester) async {
      await tester.pumpWidget(
        _hostWithAppBar(
          AdaptiveNavBar(screenWidth: 800, navBarItems: items),
        ),
      );
      expect(find.byType(NavBarWide), findsOneWidget);
      expect(find.byType(NavBarSmall), findsNothing);
    });
  });

  group('AdaptiveNavBar — title', () {
    testWidgets('shows no title when none is provided', (tester) async {
      final bar = AdaptiveNavBar(screenWidth: 1024, navBarItems: items);
      await tester.pumpWidget(_hostWithAppBar(bar));
      expect(bar.title, isNull);
    });

    testWidgets('uses the provided title widget when given', (tester) async {
      await tester.pumpWidget(
        _hostWithAppBar(
          AdaptiveNavBar(
            screenWidth: 1024,
            navBarItems: items,
            title: const Text('My App'),
          ),
        ),
      );
      expect(find.text('My App'), findsOneWidget);
      expect(find.text('MB NavBar'), findsNothing);
    });

    testWidgets(
        'does not wrap title in InkWell when canTitleGetTapped is false',
        (tester) async {
      await tester.pumpWidget(
        _hostWithAppBar(
          AdaptiveNavBar(
            screenWidth: 1024,
            navBarItems: items,
            title: const Text('Static'),
          ),
        ),
      );

      final inkWell = find.ancestor(
        of: find.text('Static'),
        matching: find.byType(InkWell),
      );
      expect(inkWell, findsNothing);
    });

    testWidgets(
        'wraps title in tappable InkWell when canTitleGetTapped is true '
        'and fires onTitleTapped', (tester) async {
      var titleTaps = 0;
      await tester.pumpWidget(
        _hostWithAppBar(
          AdaptiveNavBar(
            screenWidth: 1024,
            navBarItems: items,
            title: const Text('Tap Me'),
            canTitleGetTapped: true,
            onTitleTapped: () => titleTaps++,
          ),
        ),
      );

      await tester.tap(find.text('Tap Me'));
      await tester.pump();

      expect(titleTaps, 1);
    });
  });

  group('AdaptiveNavBar — base AppBar behavior', () {
    testWidgets('is an AppBar subclass and mounts in the Scaffold',
        (tester) async {
      final bar = AdaptiveNavBar(screenWidth: 1024, navBarItems: items);
      expect(bar, isA<AppBar>());

      await tester.pumpWidget(_hostWithAppBar(bar));
      expect(find.byType(AdaptiveNavBar), findsOneWidget);
    });

    testWidgets('forwards backgroundColor to the underlying AppBar',
        (tester) async {
      await tester.pumpWidget(
        _hostWithAppBar(
          AdaptiveNavBar(
            screenWidth: 1024,
            navBarItems: items,
            backgroundColor: Colors.red,
          ),
        ),
      );

      // AdaptiveNavBar extends AppBar, so retrieve it via its own type
      // (find.byType matches the exact runtimeType).
      final bar = tester.widget<AdaptiveNavBar>(find.byType(AdaptiveNavBar));
      expect(bar.backgroundColor, Colors.red);
    });
  });
}
