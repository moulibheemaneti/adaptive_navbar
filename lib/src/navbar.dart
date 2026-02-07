import 'package:flutter/material.dart';

import '../src/navbar_item.dart';
import '../src/navbar_small.dart';
import '../src/navbar_wide.dart';

/// [AdaptiveNavBar] inherits [AppBar].
///
/// `AdaptiveNavBar` accepts all the arguments that `AppBar` accepts in it's constructor.
/// In addition to the `AppBar`, `AdaptiveNavBar` considers few other arguments too.
///
/// Other parameters are:
///
/// `canTitleGetTapped`
///
/// `onTitleTapped`
///
/// `screenWidth`
///
/// `navBarItems`
///
class AdaptiveNavBar extends AppBar {
  /// [canTitleGetTapped]
  final bool canTitleGetTapped;

  /// [onTitleTapped]
  final void Function()? onTitleTapped;

  /// Based on [screenWidth], the 'AdaptiveNavBar' decides
  /// which widget it should be displayed
  ///
  /// If `screenWidth < 700` it displays [NavBarSmall]
  /// else it displays [NavBarWide]
  final double? screenWidth;

  /// [navBarItems] instead of [actions] in `AppBar`
  ///
  /// The list of navBarItems of type `List<NavBarItem>`
  final List<NavBarItem> navBarItems;

  /// `AdaptiveNavBar`'s named constructor
  AdaptiveNavBar({
    this.canTitleGetTapped = false,
    this.onTitleTapped,
    required this.screenWidth,
    required this.navBarItems,
    super.key,
    Widget? title,
    super.leading,
    super.automaticallyImplyLeading,
    super.flexibleSpace,
    super.bottom,
    super.elevation,
    super.shadowColor,
    super.shape,
    super.backgroundColor,
    super.foregroundColor,
    super.iconTheme,
    super.actionsIconTheme,
    super.primary,
    super.centerTitle,
    super.excludeHeaderSemantics,
    super.titleSpacing,
    super.toolbarOpacity,
    super.bottomOpacity,
    super.toolbarHeight,
    super.leadingWidth,
    super.toolbarTextStyle,
    super.titleTextStyle,
    super.systemOverlayStyle,
  }) : super(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: canTitleGetTapped
                ? InkWell(
                    onTap: onTitleTapped,
                    child: title ??
                        const Text(
                          "MB NavBar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                  )
                : title ??
                    const Text(
                      "MB NavBar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
          ),
          actions: [
            screenWidth! < 800.toDouble()
                ? NavBarSmall(
                    navBarItems: navBarItems,
                  )
                : NavBarWide(
                    navBarItems: navBarItems,
                  ),
          ],
        );
}
