import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({super.key}); // Constructor

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isRememberMeChecked = false;
  bool isNewPasswordVisible = false; // Toggles visibility for new password
  bool isConfirmPasswordVisible = false; // Toggles visibility for confirm password
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? errorMessage; // Error message if passwords don't match

  void _validatePasswords() {
    setState(() {
      if (newPasswordController.text != confirmPasswordController.text) {
        errorMessage = "Both passwords are not the same.";
      } else {
        errorMessage = null; // Clear the error if passwords match
        // Perform "Change Password" action here
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password changed successfully!")),
        );
      }
    });
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/pngegg 1.png', // Add your logo here
                    height: 120,
                  ),
                  const SizedBox(height: 80),
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
                          controller: newPasswordController,
                          obscureText: !isNewPasswordVisible,
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
                            suffixIcon: IconButton(
                              icon: Icon(
                                isNewPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  isNewPasswordVisible = !isNewPasswordVisible;
                                });
                              },
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
                          controller: confirmPasswordController,
                          obscureText: !isConfirmPasswordVisible,
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
                            suffixIcon: IconButton(
                              icon: Icon(
                                isConfirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  isConfirmPasswordVisible =
                                      !isConfirmPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Error Message
                        if (errorMessage != null)
                          Text(
                            errorMessage!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
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
                              _validatePasswords();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1D1E33),
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
