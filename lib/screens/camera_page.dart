// lib/screens/camera_page.dart
import 'package:flutter/material.dart';
import '../app_drawer.dart';

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camera")),
      drawer: const AppDrawer(), 
      body: const Center(child: Text("Camera functionality coming soon!")),
    );
  }
}