
import 'package:cm_enrollement_fund/home%20Screen/ddo_screen/components/request_iteam.dart';
import 'package:cm_enrollement_fund/home%20Screen/ddo_screen/components/state_card.dart';
import 'package:flutter/material.dart';




class DdoScreen extends StatelessWidget {
  final String name;

  DdoScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF1D1E33),
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
                Text(
                  'Welcome $name! ', // Dynamic value here $name!
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
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
                              // Use imported method
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
                            // Use imported method
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
          ),
        ],
      ),
    );
  }
}
