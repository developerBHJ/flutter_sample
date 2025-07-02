import 'package:flutter/material.dart';

class NavigationBarItem extends StatefulWidget {
  final WidgetBuilder builder;
  const NavigationBarItem({super.key, required this.builder});

  @override
  State<StatefulWidget> createState() => _NavigationBarItemState();
}

class _NavigationBarItemState extends State<NavigationBarItem>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    controller.forward();
    animation = Tween<double>(begin: 0.8, end: 1.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: animation, child: widget.builder(context));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
