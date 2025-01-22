import 'package:flutter/material.dart';

class PatientDetailsPage extends StatefulWidget {
  const PatientDetailsPage({super.key});

  @override
  _PatientDetailsPageState createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  bool showDetails = false;
  TextEditingController diagnosisController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final baseSize = screenSize.shortestSide; // For scaling elements consistently

    return Scaffold(
      backgroundColor: const Color(0xFF14213D),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Section
            Container(
              width: double.infinity,
              height: screenHeight * 0.15, // 30% of screen height
              color: const Color(0xFF14213D),
              child: Center(
                child: Text(
                  'Sajawal Karim',
                  style: TextStyle(
                    fontSize: baseSize * 0.05, // Scaled font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // White container with overlapping image
            Stack(
              clipBehavior: Clip.none,
              children: [
                // White container
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(screenWidth * 0.04), // Dynamic padding
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: screenHeight * 0.08), // Space for the overlapping image

                      // Toggle Details Section
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showDetails = !showDetails;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: baseSize * 0.02),
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          decoration: BoxDecoration(
                            color: const Color(0xFF14213D),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Detail's",
                                style: TextStyle(
                                  fontSize: baseSize * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                showDetails
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // AnimatedCrossFade
                      AnimatedCrossFade(
                        duration: const Duration(milliseconds: 300),
                        firstChild: SizedBox(height: screenHeight * 0.05), // Small placeholder when collapsed
                        secondChild: Container(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              detailRow('Father Name', 'Karim Khan'),
                              detailRow('CNIC Number', '71501-6783759-7'),
                              detailRow('Date of Birth', '28/02/1993'),
                              detailRow('Address', 'Muhallah Nagaral Gilgit'),
                              detailRow('District', 'Gilgit'),
                              detailRow('Tehsil', 'Gilgit'),
                              detailRow('Refer By',
                                  'Dr. Ahsan Cardiologist\nPHQ Hospital Gilgit'),
                              detailRow('Refer To', 'Pims Hospital Islamabad'),
                            ],
                          ),
                        ),
                        crossFadeState: showDetails
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                      ),

                      // Diagnosis Section
                      SizedBox(height: screenHeight * 0.02),
                      sectionTitle('Diagnosis', screenWidth),
                      SizedBox(height: screenHeight * 0.01),
                      customTextField(diagnosisController, 'Enter diagnosis here...'),

                      // Remarks Section
                      SizedBox(height: screenHeight * 0.03),
                      sectionTitle('Remarks', screenWidth),
                      SizedBox(height: screenHeight * 0.01),
                      customTextField(remarksController, 'Enter remarks here...'),

                      // Buttons
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade300,
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.08,
                                vertical: screenHeight * 0.015,
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF14213D),
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.08,
                                vertical: screenHeight * 0.015,
                              ),
                            ),
                            child: const Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Overlapping Image
                Positioned(
                  top: -screenHeight * 0.06, // Dynamically positioned image
                  left: (screenWidth / 2) - screenHeight * 0.06,
                  child: CircleAvatar(
                    radius: screenHeight * 0.06, // Dynamically sized image
                    backgroundImage: const AssetImage('assets/pic.jpg'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title, double screenWidth) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth * 0.045,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget customTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      maxLines: 5,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        hintText: hint,
      ),
    );
  }
}
