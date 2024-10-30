import 'package:flutter/material.dart';

/// 用于状态更新的 View
class StateView extends StatefulWidget {
  final WidgetBuilder builder;
  const StateView({super.key, required this.builder});

  @override
  State<StatefulWidget> createState() => StateViewState();
}

class StateViewState extends State<StateView> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  update() {
    if (this.mounted) setState(() {});
  }
}
