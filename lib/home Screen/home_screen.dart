import 'package:flutter/material.dart';
import '../adminrequest/admin_request.dart';
// import '../detail/request_details.dart';

class DashboardScreen extends StatelessWidget {
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
                  'Welcome ', // Dynamic value here ${userData['name']}!
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
                            _buildStatCard(
                              "Total Approved",
                              "35",
                              'assets/vector.png',
                              screenWidth / 3.5,
                            ),
                            _buildStatCard(
                              "Total Reject",
                              "20",
                              'assets/vector (1).png',
                              screenWidth / 3.5,
                            ),
                            _buildStatCard(
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
                          _buildRequestItem(
                            "Afaq Ali",
                            "Dr. Raziq Hussain",
                            "PHQ Hospital Gilgit",
                            'assets/pic.jpg',
                            context,
                          ),
                          _buildRequestItem(
                            "Sajawal Karim",
                            "Dr. Raziq Hussain",
                            "PHQ Hospital Gilgit",
                            'assets/pic.jpg',
                            context,
                          ),
                          _buildRequestItem(
                            "Maisum Abbas",
                            "Dr. Raziq Hussain",
                            "PHQ Hospital Gilgit",
                            'assets/pic.jpg',
                            context,
                          ),
                          _buildRequestItem(
                            "Naila",
                            "Dr. Raziq Hussain",
                            "PHQ Hospital Gilgit",
                            'assets/pic.jpg',
                            context,
                          ),
                          _buildRequestItem(
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

  // Method to build the stats card
  Widget _buildStatCard(
      String title, String count, String imagePath, double cardWidth) {
    return Container(
      width: cardWidth,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 35,
            height: 35,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 5),
          Text(
            count,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // Method to build a single request item
  Widget _buildRequestItem(
      String name, String referredBy, String hospital, String imagePath, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.indigo,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Referred by $referredBy",
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 2),
                Text(
                  hospital,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminRequest(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
