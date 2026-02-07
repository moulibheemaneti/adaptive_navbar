import 'package:flutter/material.dart';

/// [NavBarItem] is the smallest widget in 'AdaptiveNavBar'
///
/// This widget accepts text which will be displayed
/// as a popupmenu option in phone view
/// and as a navbar item in wide view.
class NavBarItem extends InkWell {
  /// [text] will be displayed either in popupmenu option
  /// or as a navbar item in wideview
  final String text;

  /// `NavBarItem`'s named constructor
  NavBarItem({
    required this.text,
    super.key,
    super.onTap,
    super.onDoubleTap,
    super.onLongPress,
    super.onTapDown,
    super.onTapCancel,
    super.onHighlightChanged,
    super.onHover,
    super.mouseCursor,
    super.focusColor,
    super.hoverColor,
    super.highlightColor,
    super.overlayColor,
    super.splashColor,
    super.splashFactory,
    super.radius,
    super.borderRadius,
    super.customBorder,
    bool? enableFeedback = true,
    super.excludeFromSemantics,
    super.focusNode,
    super.canRequestFocus,
    super.onFocusChange,
    super.autofocus,
  }) : super(
          child: _NavBarItemChild(text: text),
          enableFeedback: enableFeedback ?? true,
        );
}

/// [_NavBarItemChild] is the child of [NavBarItem]
class _NavBarItemChild extends StatelessWidget {
  /// [text] is displayed as a popupmenuitem or navbaritem in wide screen.
  final String text;

  /// `_NavBarItemChild`'s named constructor
  const _NavBarItemChild({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
        ),
      ),
    );
  }
}
