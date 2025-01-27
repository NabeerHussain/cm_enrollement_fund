import 'package:flutter/material.dart';
import '../../forgotPassword/forgot_screen.dart';

class UserDetailScreen extends StatefulWidget {
  final String name;
  final String email;

  const UserDetailScreen({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF1D1E33),
      body: SafeArea(
        child: Column(
          children: [
            // Top Section (Blue background)
            Container(
              height: screenHeight * 0.12,
              color: const Color(0xFF1D1E33),
            ),

            // Profile Details Section
            Expanded(
              child: Stack(
                children: [
                  // White background with rounded corners
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.1,
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                      ),
                   
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                             SizedBox(height: screenHeight * 0.03), // User Details
                          Row(
                            children: [
                              const Icon(Icons.person, color: Colors.black),
                              const SizedBox(width: 10),
                              Text(
                                "Name: ${widget.name}",
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Row(
                            children: [
                              const Icon(Icons.email, color: Colors.black),
                              const SizedBox(width: 10),
                              Text(
                                "Email: ${widget.email}",
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Row(
                            children: [
                              const Icon(Icons.phone, color: Colors.black),
                              const SizedBox(width: 10),
                              const Text(
                                "Phone: (Not provided)", // Placeholder for phone
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Row(
                            children: [
                              const Icon(Icons.badge, color: Colors.black),
                              const SizedBox(width: 10),
                              const Text(
                                "CNIC: (Not provided)", // Placeholder for CNIC
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.03),

                          // Change Password Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1D1E33),
                                padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.02,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon: const Icon(Icons.lock, color: Colors.white),
                              label: const Text(
                                'Change Password',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          // Logout Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.02,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon:
                                  const Icon(Icons.logout, color: Colors.white),
                              label: const Text(
                                'Logout',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Profile Picture in White Container
                  Positioned(
                    top: screenHeight * 0.02, // Position inside white container
                    left: screenWidth * 0.33, // Center horizontally
                    child: CircleAvatar(
                      radius: screenHeight * 0.06,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: screenHeight * 0.055,
                        backgroundImage: AssetImage('assets/pic.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
