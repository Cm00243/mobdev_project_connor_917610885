import 'package:flutter/material.dart';
import 'near_me_page.dart';
import 'camera_page.dart';
import 'emergency_page.dart';
import 'other_page.dart';
import 'request_meal_page.dart'; 
import 'calendar_page.dart'; 
import 'package:firebase_auth/firebase_auth.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current user
    final User? user = FirebaseAuth.instance.currentUser;

    // Display the user's email
    String userEmail = user?.email ?? 'User';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome, $userEmail'),  
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color.fromARGB(255, 5, 2, 233),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _logout(context); 
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMenuButton(context, 'Seek Emergency Help', Colors.red, EmergencyPage()),
              const SizedBox(height: 16),
              _buildMenuButton(context, 'Seek Other Help', Colors.blue, OtherPage()),
              const SizedBox(height: 16),
              _buildMenuButton(context, 'Request Meal', Colors.green, RequestMealPage()),
              const SizedBox(height: 16),
              _buildMenuButton(context, 'Calendar', Colors.blue, CalendarPage()),
              const SizedBox(height: 16),
              _buildMenuButton(context, 'Easy Picture Taking', Colors.blue, CameraPage()),
              const SizedBox(height: 16),
              _buildMenuButton(context, 'Near Me', Colors.blue, NearMePage()),
            ],
          ),
        ),
      ),
    );
  }

  // Handles the signout function of the hamburger menu
  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut(); 
      
      Navigator.of(context).pushReplacementNamed('/login');
    } catch (e) {
      print("Error logging out: $e");
    }
  }

  Widget _buildMenuButton(BuildContext context, String text, Color color, Widget page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        textStyle: const TextStyle(
          fontSize: 20,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(text),
    );
  }
}