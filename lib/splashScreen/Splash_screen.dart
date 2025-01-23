
import 'package:flutter/material.dart';

import '../login Screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF14213D), // Dark blue background color
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                Image.asset(
                  'assets/logo.png', // Add your logo asset path here
                  width: screenWidth * 0.4, // Adjust width based on screen size
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive spacing
                // Title
                Text(
                  "CM Health Endowment Fund\nGovernment of Gilgit-Baltistan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.05, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // Responsive spacing
                // Loading Indicator
                const CircularProgressIndicator(
                  color: Colors.white,
                ),
                SizedBox(height: screenHeight * 0.04), // Responsive spacing
                // Footer Text
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                  child: Text(
                    "Powered by SATA Technologies", // Replace with your footer text
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.035, // Responsive font size
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
