import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home Screen/ddo_screen/ddo_screen.dart';
import 'home Screen/doctor screen/doctor_screen.dart'; // Import AuthProvider
import 'providers/user.dart';
import 'splashScreen/Splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),  // Load user on app start
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Set default background color
      ),
      home: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          // Check if user is authenticated and navigate accordingly
          if (authProvider.isAuthenticated) {
            if (authProvider.user?.userType == 'doctor') {
              return  DashboardScreen(name: 'name ', email: 'email',);  // Show the doctor dashboard
            } else if (authProvider.user?.userType == 'ddo') {
              return  DdoScreen(name: 'name ');  // Show the admin dashboard
            } else {
              return const SplashScreen();  // Show splash screen if user type is unknown
            }
          } else {
            return const SplashScreen();  // Show splash screen if not authenticated
          }
        },
      ),
    );
  }
}
