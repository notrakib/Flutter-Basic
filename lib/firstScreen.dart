import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen(this.changeScreen, {super.key});

  final void Function() changeScreen;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: changeScreen, child: const Text("Next Screen"));
  }
}
