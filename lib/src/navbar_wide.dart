import 'package:flutter/material.dart';

import '../src/navbar_item.dart';

/// [NavBarWide] inheritst [StatelessWidget]
///
/// [navBarItems] are converted to wide navbar
class NavBarWide extends StatelessWidget {
  /// [navBarItems] are converted to wide navbar
  final List<NavBarItem> navBarItems;

  /// Fraction of screen width used by the wide navbar container.
  ///
  /// Defaults to `1/3`. Pass `1.0` to span full screen width.
  final double widthFactor;

  /// Alignment of nav items within the wide navbar container.
  ///
  /// Defaults to [Alignment.centerRight].
  final AlignmentGeometry alignment;

  /// `NavBarWide`'s named constructor
  const NavBarWide({
    super.key,
    required this.navBarItems,
    this.widthFactor = 1 / 3,
    this.alignment = Alignment.centerRight,
  });

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.transparent,
      width: sw * widthFactor,
      child: Align(
        alignment: alignment,
        child: Row(
          children: List.generate(
            navBarItems.length,
            (index) {
              return Expanded(
                child: navBarItems[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
