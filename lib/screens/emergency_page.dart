// lib/screens/emergency_page.dart
import 'package:flutter/material.dart';
import '../app_drawer.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Emergency")),
      drawer: const AppDrawer(), 
      body: const Center(child: Text("Emergency contacts coming soon!")),
    );
  }
}