import 'package:flutter/material.dart';
import '../../bottombar/bottom_bar.dart';
import 'component/request_iteam.dart';
import 'component/state_card.dart';
import 'profile.dart';

class DashboardScreen extends StatefulWidget {
  final String name;
  final String email;

  DashboardScreen({required this.name,required this.email});  

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0; // Track the selected tab

  // Handle navigation bar taps
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        // Stay on the Dashboard
        break;
      case 1:
        // Navigate to Requests (example)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Placeholder(
              child: Center(child: Text("Requests Page")),
            ),
          ),
        );
        break;
      case 2:
        // Navigate to Profile
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailScreen(name: widget.name , email:widget.email),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF1D1E33),
      body: Column(
        children: [
          // Blue Area at the Top
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF1D1E33),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    Text(
                      'Welcome ${widget.name}!', // Dynamic value here
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetailScreen(
                              name: widget.name,
                              email: widget.email,
                            ),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/pic.jpg'),
                        radius: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Cardiologist",
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
              ],
            ),
          ),
          // White Container Section
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
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Stats Section
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  buildStatCard(
                                    "Total Approved",
                                    "35",
                                    'assets/vector.png',
                                    screenWidth / 3.5,
                                  ),
                                  buildStatCard(
                                    "Total Reject",
                                    "20",
                                    'assets/vector (1).png',
                                    screenWidth / 3.5,
                                  ),
                                  buildStatCard(
                                    "Total Cases",
                                    "55",
                                    'assets/vector (2).png',
                                    screenWidth / 3.5,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            // New Requests Header
                            Container(
                              padding: const EdgeInsets.only(top: 12, left: 12),
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1D1E33),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                "New Requests",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Scrollable New Requests Section
                            ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                buildRequestItem(
                                  "Afaq Ali",
                                  "Dr. Raziq Hussain",
                                  "PHQ Hospital Gilgit",
                                  'assets/pic.jpg',
                                  context,
                                ),
                                buildRequestItem(
                                  "Sajawal Karim",
                                  "Dr. Raziq Hussain",
                                  "PHQ Hospital Gilgit",
                                  'assets/pic.jpg',
                                  context,
                                ),
                                buildRequestItem(
                                  "Maisum Abbas",
                                  "Dr. Raziq Hussain",
                                  "PHQ Hospital Gilgit",
                                  'assets/pic.jpg',
                                  context,
                                ),
                                buildRequestItem(
                                  "Naila",
                                  "Dr. Raziq Hussain",
                                  "PHQ Hospital Gilgit",
                                  'assets/pic.jpg',
                                  context,
                                ),
                                buildRequestItem(
                                  "Tariq Ullah",
                                  "Dr. Raziq Hussain",
                                  "PHQ Hospital Gilgit",
                                  'assets/pic.jpg',
                                  context,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Custom Navigation Bar
                  CustomNavBar(
                    currentIndex: _currentIndex,
                    onTabTapped: _onTabTapped,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
