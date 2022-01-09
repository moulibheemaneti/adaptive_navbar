import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../src/navbar_item.dart';
import '../src/navbar_wide.dart';
import '../src/navbar_small.dart';

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
    Key? key,
    Widget? title,
    Widget? leading,
    bool automaticallyImplyLeading = true,
    Widget? flexibleSpace,
    PreferredSizeWidget? bottom,
    double? elevation,
    Color? shadowColor,
    ShapeBorder? shape,
    Color? backgroundColor,
    Color? foregroundColor,
    IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    bool primary = true,
    bool? centerTitle,
    bool excludeHeaderSemantics = false,
    double? titleSpacing,
    double toolbarOpacity = 1.0,
    double bottomOpacity = 1.0,
    double? toolbarHeight,
    double? leadingWidth,
    TextStyle? toolbarTextStyle,
    TextStyle? titleTextStyle,
    SystemUiOverlayStyle? systemOverlayStyle,
  }) : super(
          key: key,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: canTitleGetTapped
                ? InkWell(
                    onTap: onTitleTapped,
                    child: title ??
                        const Text(
                          "MB NavBar",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                  )
                : title ??
                    const Text(
                      "MB NavBar",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          elevation: elevation,
          shadowColor: shadowColor,
          shape: shape,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          iconTheme: iconTheme,
          actionsIconTheme: actionsIconTheme,
          primary: primary,
          centerTitle: centerTitle,
          excludeHeaderSemantics: excludeHeaderSemantics,
          titleSpacing: titleSpacing,
          toolbarOpacity: toolbarOpacity,
          bottomOpacity: bottomOpacity,
          toolbarHeight: toolbarHeight,
          leadingWidth: leadingWidth,
          toolbarTextStyle: toolbarTextStyle,
          titleTextStyle: titleTextStyle,
          systemOverlayStyle: systemOverlayStyle,
        );
}
