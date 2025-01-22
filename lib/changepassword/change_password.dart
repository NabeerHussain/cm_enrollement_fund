import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({super.key}); // Constructor

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isRememberMeChecked = false; // Tracks if "Remember Me" checkbox is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent resizing when the keyboard is open
      backgroundColor: const Color(0xFF1D1E33), // Navy blue background
      body: SafeArea(
        child: Column(
          children: [
            // Top Section: Logo and Title
            Container(
              height: MediaQuery.of(context).size.height * 0.35, // Responsive height for the blue section
              color: const Color(0xFF1D1E33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                children: [
                   Image.asset(
                    'assets/pngegg 1.png', // Add your logo here
                    height: 120, // Logo size
                  ),
                  const SizedBox(height: 80), // Spacing between title and "Change Password"
                  const Text(
                    'Change Password',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Section: Functionality
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // New Password Field
                        const Text(
                          'New Password',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          obscureText: true, // Hides the text for passwords
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0xFF1D1E33),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                  
                        // Confirm Password Field
                        const Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          obscureText: true, // Hides the text for passwords
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0xFF1D1E33),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                  
                        // Remember Me Checkbox
                        Row(
                          children: [
                            Checkbox(
                              value: isRememberMeChecked,
                              onChanged: (value) {
                                setState(() {
                                  isRememberMeChecked = value!;
                                });
                              },
                              activeColor: const Color(0xFF1D1E33),
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                  
                        // Change Password Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle "Change Password" action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1D1E33), // Navy Blue color
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Change Password',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
