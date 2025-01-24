import 'package:flutter/material.dart';

import '../changepassword/change_password.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});

  final _otpControllers = List.generate(4, (index) => TextEditingController());
  final _formKey = GlobalKey<FormState>();

  void _handleVerify(BuildContext context) {
    // Combine all OTP inputs into a single string
    // final otpCode = _otpControllers.map((controller) => controller.text).join();

    // Validate each field and check if all are numeric and exactly 1 digit
    bool isValid = _otpControllers.every((controller) =>
        controller.text.isNotEmpty && RegExp(r'^\d$').hasMatch(controller.text));

    if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid 4-digit code")),
      );
      return;
    }

    // Proceed to the ChangePassword screen if validation passes
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChangePassword()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF1D1E33),
      body: SafeArea(
        child: Column(
          children: [
            // Top Section: Logo and Title
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              color: const Color(0xFF1D1E33),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/pngegg 1.png',
                      height: 170,
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Phone Verification',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 30),
                  
                          // Verification Text
                          const Text(
                            "Enter Your Verification Code Sent to\n+92355...",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 20),
                  
                          // Verification Code Boxes
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(4, (index) {
                              return Container(
                                width: 50,
                                height: 50,
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                  controller: _otpControllers[index],
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: const InputDecoration(
                                    counterText: "",
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    if (value.length == 1 && index < 3) {
                                      // Move to the next field automatically
                                      FocusScope.of(context).nextFocus();
                                    } else if (value.isEmpty && index > 0) {
                                      // Move to the previous field if backspace
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 80),
                  
                          // Buttons: Resend and Verify
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Resend Button
                              SizedBox(
                                width: 140,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle Resend action
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Verification code resent"),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: const Color(0xFF1D1E33),
                                    side: const BorderSide(
                                      color: Color(0xFF1D1E33),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'Resend',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                  
                              // Verify Button
                              SizedBox(
                                width: 140,
                                child: ElevatedButton(
                                  onPressed: () => _handleVerify(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1D1E33),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'Verify',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
