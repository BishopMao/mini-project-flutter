import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'dart:convert'; // For JSON
import 'home_page.dart'; // Import your Home Page
import 'login_page.dart'; // Import your Login Page

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  String name = 'Unknown';
  String age = 'Unknown';
  String job = 'Unknown';
  String address = 'Unknown';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Load user data from SharedPreferences
  void _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonUserData = prefs.getString('userData');

    if (jsonUserData != null) {
      // Decode JSON string only if not null
      Map<String, dynamic> userData = jsonDecode(jsonUserData);

      setState(() {
        // Safely assign values, using null-aware operators
        name = userData['name'] ?? 'Unknown';
        age = userData['age'] ?? 'Unknown';
        job = userData['job'] ?? 'Unknown';
        address = userData['address'] ?? 'Unknown';
      });
    }
  }

  // Clear the saved user data and navigate to the Login Page
  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userData'); // Remove user data from SharedPreferences
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const LoginPage()), // Navigate to Login Page
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Member Page'),
        actions: [
          // Home Button
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const HomePage()), // Navigate to Home Page
              );
            },
          ),
          // Log Out Button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout, // Call the logout function
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/3334570.png', // Background image from assets
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content (member details)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Card(
                elevation: 4, // Adds shadow to the card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://i.imgur.com/BoN9kdC.png', // Image from network
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Text('Failed to load image');
                        },
                      ),
                      const SizedBox(
                          height: 20), // Space between image and details
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: $name',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Age: $age',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Job: $job',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Address: $address',
                            style: GoogleFonts.openSans(
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
