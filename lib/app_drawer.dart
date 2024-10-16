import 'package:flutter/material.dart';
import 'screens/near_me_page.dart';
import 'screens/camera_page.dart';
import 'screens/emergency_page.dart';
import 'screens/other_page.dart';
import 'screens/request_meal_page.dart';
import 'screens/calendar_page.dart';
import 'auth_gate.dart'; 
import 'package:firebase_auth/firebase_auth.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current user
    final User? user = FirebaseAuth.instance.currentUser;
    
    // Get user's email or fallback to 'Guest' if no user is found
    String userEmail = user?.email ?? 'Guest';

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 5, 2, 233),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 10), // Add space between text elements
                Text(
                  'Logged in as:',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
                Text(
                  userEmail,  // Display the user's email
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _createDrawerItem(
            context,
            text: 'Near Me',
            page: NearMePage(),
          ),
          _createDrawerItem(
            context,
            text: 'Camera',
            page: CameraPage(),
          ),
          _createDrawerItem(
            context,
            text: 'Emergency Help',
            page: EmergencyPage(),
          ),
          _createDrawerItem(
            context,
            text: 'Other Help',
            page: OtherPage(),
          ),
          _createDrawerItem(
            context,
            text: 'Request Meal',
            page: RequestMealPage(),
          ),
          _createDrawerItem(
            context,
            text: 'Calendar',
            page: CalendarPage(),
          ),
          const Divider(),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              _logout(context);
            },
          ),
        ],
      ),
    );
  }

  ListTile _createDrawerItem(BuildContext context,
      {required String text, required Widget page}) {
    return ListTile(
      title: Text(text),
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      
      // Navigate back to AuthGate only if the user is logged out successfully
      if (FirebaseAuth.instance.currentUser == null) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const AuthGate()),
          (Route<dynamic> route) => false, // Remove all previous routes
        );
      }
    } catch (e) {
      // Handle any errors that occur during sign out
      print('Error signing out: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to log out')),
      );
    }
  }
}