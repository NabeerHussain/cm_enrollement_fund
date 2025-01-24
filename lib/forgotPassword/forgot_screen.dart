import 'package:flutter/material.dart';
import '../otp/verification_screen.dart';

class ForgotScreen extends StatefulWidget {
  ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  bool isEmailSelected = false;
  bool isPhoneSelected = false;
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VerificationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF1D1E33),
        body: SafeArea(
          child: Column(
            children: [
              // Top Section
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
                      // const SizedBox(height: 70),
                      const Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Bottom Section
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
                  child: SingleChildScrollView( // Make content scrollable
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              "Enter Your Phone number to reset\nYour Password",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                           const Center(
                            child: Text(
                              "Verify by",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 140,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isEmailSelected = true;
                                      isPhoneSelected = false;
                                      _controller.clear();
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isEmailSelected
                                        ? const Color(0xFF1D1E33)
                                        : Colors.white,
                                    foregroundColor: isEmailSelected
                                        ? Colors.white
                                        : const Color(0xFF1D1E33),
                                    side: const BorderSide(
                                      color: Color(0xFF1D1E33),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text('Email'),
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 140,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isEmailSelected = false;
                                      isPhoneSelected = true;
                                      _controller.clear();
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isPhoneSelected
                                        ? const Color(0xFF1D1E33)
                                        : Colors.white,
                                    foregroundColor: isPhoneSelected
                                        ? Colors.white
                                        : const Color(0xFF1D1E33),
                                    side: const BorderSide(
                                      color: Color(0xFF1D1E33),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text('Phone no'),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Input Field
                          TextFormField(
                            controller: _controller,
                            keyboardType: isPhoneSelected
                                ? TextInputType.phone
                                : TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return isPhoneSelected
                                    ? "Please enter a valid phone number"
                                    : "Please enter a valid email";
                              }
                              if (isEmailSelected &&
                                  !RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                      .hasMatch(value)) {
                                return "Please enter a valid email address";
                              }
                              if (isPhoneSelected &&
                                  !RegExp(r'^\d{11}$').hasMatch(value)) {
                                return "Please enter a valid 11-digit phone number";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: isPhoneSelected
                                  ? "Enter mobile number"
                                  : "Enter email",
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color(0xFF1D1E33),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 100),
                          // Continue Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _handleContinue,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1D1E33),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Continue',
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
      ),
    );
  }
}
