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
/// `titlePadding`
///
/// `screenWidth`
///
/// `navBarItems`
///
/// `wideNavBarWidthFactor`
///
/// `wideNavBarAlignment`
///
class AdaptiveNavBar extends AppBar {
  /// [canTitleGetTapped]
  final bool canTitleGetTapped;

  /// [onTitleTapped]
  final void Function()? onTitleTapped;

  /// Padding applied around the title widget.
  ///
  /// Defaults to `EdgeInsets.symmetric(horizontal: 20)`.
  /// Pass [EdgeInsets.zero] to remove padding.
  final EdgeInsetsGeometry titlePadding;

  /// Based on [screenWidth], the 'AdaptiveNavBar' decides
  /// which widget it should be displayed
  ///
  /// If `screenWidth < 800` it displays [NavBarSmall]
  /// else it displays [NavBarWide]
  final double? screenWidth;

  /// [navBarItems] instead of [actions] in `AppBar`
  ///
  /// The list of navBarItems of type `List<NavBarItem>`
  final List<NavBarItem> navBarItems;

  /// Fraction of screen width used by [NavBarWide].
  ///
  /// Defaults to `1/3`. Pass `1.0` to span full screen width.
  final double wideNavBarWidthFactor;

  /// Alignment of nav items within [NavBarWide].
  ///
  /// Defaults to [Alignment.centerRight].
  final AlignmentGeometry wideNavBarAlignment;

  /// `AdaptiveNavBar`'s named constructor
  AdaptiveNavBar({
    this.canTitleGetTapped = false,
    this.onTitleTapped,
    this.titlePadding = const EdgeInsets.symmetric(horizontal: 20),
    this.wideNavBarWidthFactor = 1 / 3,
    this.wideNavBarAlignment = Alignment.centerRight,
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
          title: title == null
              ? null
              : Padding(
                  padding: titlePadding,
                  child: canTitleGetTapped
                      ? InkWell(
                          onTap: onTitleTapped,
                          child: title,
                        )
                      : title,
                ),
          actions: [
            screenWidth! < 800.toDouble()
                ? NavBarSmall(
                    navBarItems: navBarItems,
                  )
                : NavBarWide(
                    navBarItems: navBarItems,
                    widthFactor: wideNavBarWidthFactor,
                    alignment: wideNavBarAlignment,
                  ),
          ],
        );
}
