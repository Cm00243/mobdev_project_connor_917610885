// lib/screens/other_page.dart
import 'package:flutter/material.dart';
import '../app_drawer.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calendar")),
      drawer: const AppDrawer(), 
      body: const Center(child: Text("Calendar coming soon!")),
    );
  }
}