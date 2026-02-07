import 'package:flutter/material.dart';

import '../src/navbar_item.dart';

/// [NavBarSmall] inherits [StatelessWidget]
///
/// [navBarItems] is converted to a
/// popupmenubutton in phone view
class NavBarSmall extends StatelessWidget {
  /// [navBarItems] is converted to a
  /// popupmenubutton in phone view
  final List<NavBarItem> navBarItems;

  /// `NavBarSmall`'s named constructor
  const NavBarSmall({
    super.key,
    required this.navBarItems,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PopupMenuButton(
        itemBuilder: (BuildContext context) {
          return List.generate(
            navBarItems.length,
            (index) => PopupMenuItem(
              child: navBarItems[index],
            ),
          );
        },
        child: const Icon(
          Icons.menu,
        ),
      ),
    );
  }
}
