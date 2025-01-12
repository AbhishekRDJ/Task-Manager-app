import 'package:flutter/material.dart';

class GeminiPage extends StatelessWidget {
  const GeminiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gemini Page")),
      body: const Center(child: Text("Welcome to the Gemini Page!")),
    );
  }
}
