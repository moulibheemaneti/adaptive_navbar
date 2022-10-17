import 'package:flutter/material.dart';

import '../src/navbar_item.dart';

/// [NavBarWide] inheritst [StatelessWidget]
///
/// [navBarItems] are converted to wide navbar
class NavBarWide extends StatelessWidget {
  /// [navBarItems] are converted to wide navbar
  final List<NavBarItem> navBarItems;

  /// `NavBarWide`'s named constructor
  const NavBarWide({
    Key? key,
    required this.navBarItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.transparent,
      width: sw / 3,
      child: Align(
        alignment: Alignment.centerRight,
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
