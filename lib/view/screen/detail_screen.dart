import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Screen'),
      ),
      body: const Center(
        child: Text('Blog Screen'),
      ),
    );
  }
}
