import 'package:flutter/material.dart';
import 'home_page.dart'; // Import หน้าโฮม

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login and Register',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(), // Start the app at HomePage
    );
  }
}
