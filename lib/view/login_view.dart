import 'package:flutter/material.dart';
import 'package:heasey_app/utils/constant/color_const.dart';
import 'package:heasey_app/view/signup_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Successful!")),
      );
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+'); // Simple email validation
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width to determine mobile or web
    final screenWidth = MediaQuery.of(context).size.width;

    // Set a breakpoint for mobile vs. web (larger screens like Chrome)
    final isMobile = screenWidth < 600;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20.0 : 50.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isMobile
                  ? double.infinity
                  : 500, // Limit width on larger screens
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Login Now",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: baseColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: const Text(
                      "Don't Have Account? Register Now",
                      style: TextStyle(color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Wrap TextFormField in a Container to control width based on screen size
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: "EMAIL",
                      hintText: "hello@example.com",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: "PASSWORD",
                      border: OutlineInputBorder(),
                    ),
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "other",
                    style: TextStyle(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/google.png',
                          scale: 9,
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: const Icon(Icons.apple,
                              size: 40, color: Colors.black)),
                      InkWell(
                          onTap: () {},
                          child: const Icon(Icons.phone,
                              size: 37, color: Colors.black)),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: baseColor,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Adjust this value to decrease radius
                      ),
                    ),
                    onPressed: _submitForm,
                    child: const Text("Submit",
                        style: TextStyle(fontSize: 18, color: whiteColor)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
