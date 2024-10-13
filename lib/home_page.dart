import 'package:flutter/material.dart';
import 'register_page.dart'; // Import Register Page
import 'login_page.dart'; // Import Login Page

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          // Home Button in AppBar
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
          // Register Button in AppBar
          IconButton(
            icon: const Icon(Icons.app_registration),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const RegisterPage()), // Navigate to Register Page
              );
            },
          ),
          // Login Button in AppBar
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const LoginPage()), // Navigate to Login Page
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white, // Background color of the container
            borderRadius: BorderRadius.circular(12), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Center vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center horizontally
            children: [
              Image.asset(
                'assets/me.png',
                height: 200,
                width: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16), // Space between image and text
              const Text(
                'Mini Project Flutter + Software Engineer',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10), // Additional spacing
              const Text(
                'นายอภิสิทธิ์ รัตนสุทธิ  รหัสนักศึกษา 65001308101',
                textAlign: TextAlign.center, // Center align the text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
