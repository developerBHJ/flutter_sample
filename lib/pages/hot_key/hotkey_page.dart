import 'package:flutter/material.dart';

class HotkeyPage extends StatefulWidget {
  const HotkeyPage({super.key});

  @override
  State<StatefulWidget> createState() => _HotKeyPageState();
}

class _HotKeyPageState extends State<HotkeyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("HotkeyPage")),color: Colors.green,);
  }
}
