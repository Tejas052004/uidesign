import 'package:flutter/material.dart';

class SafeAreaWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final bool scrollable;
  // final Color backgroundColor;

  const SafeAreaWrapper({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.scrollable = true,
    // this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: padding,
      child: child,
    );

    return SafeArea(
      child: Container(
        // color: backgroundColor,
        child: scrollable
            ? SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: content,
        )
            : content,
      ),
    );
  }
}
