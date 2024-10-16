// lib/screens/request_meal_page.dart
import 'package:flutter/material.dart';
import '../app_drawer.dart';

class RequestMealPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Request Meal")),
      drawer: const AppDrawer(), 
      body: const Center(child: Text("Menu coming soon!")),
    );
  }
}