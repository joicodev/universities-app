import 'package:flutter/material.dart';
import 'package:universities_app/extensions/context_extensions.dart';

class BaseScaffold extends StatefulWidget {
  final double? top;
  final double? bottom;
  final Widget? titleAppBar;
  final bool? showGoBackBtn;
  final List<Widget>? actionsAppBar;
  final EdgeInsets? minimum;
  final Widget? leading;
  final bool? bodyIntoContainer;
  final bool? centerTitleAppBar;
  final PreferredSizeWidget? appBar;

  /// Whether the route can be popped.
  final bool canPop;

  /// The widget below this widget in the tree.
  final Widget child;

  /// The color of the [Material] widget that underlies the entire Scaffold.
  final Color? backgroundColor;

  const BaseScaffold({
    Key? key,
    required this.child,
    this.top,
    this.bottom,
    this.minimum,
    this.titleAppBar,
    this.backgroundColor,
    this.appBar,
    this.showGoBackBtn,
    this.actionsAppBar,
    this.leading,
    this.centerTitleAppBar,
    this.canPop = false,
    this.bodyIntoContainer = true,
  }) : super(key: key);

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  Widget _buildScaffoldBody() {
    if (widget.bodyIntoContainer == true) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: widget.child,
      );
    }

    return widget.child;
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.backgroundColor ?? context.backgroundColor;
    return SafeArea(
      top: false,
      minimum: widget.minimum ??
          EdgeInsets.only(
            top: widget.top ?? context.height * 0.147,
            bottom: widget.bottom ?? context.height * 0.015,
          ),
      child: Scaffold(
        appBar: widget.appBar,
        backgroundColor: bgColor,
        body: _buildScaffoldBody(),
      ),
    );
  }
}
