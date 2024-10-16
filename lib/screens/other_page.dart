// lib/screens/other_page.dart
import 'package:flutter/material.dart';
import '../app_drawer.dart';

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Other Options")),
      drawer: const AppDrawer(), 
      body: const Center(child: Text("Other features coming soon!")),
    );
  }
}