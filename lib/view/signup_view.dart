import 'package:flutter/material.dart';
import 'package:heasey_app/utils/constant/color_const.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  // Controllers for all input fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();

  // Global key for the form
  final _formKey = GlobalKey<FormState>();

  // Animation controller
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animationController.forward();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dobController.dispose();
    _referralCodeController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FadeTransition(
          opacity: _animationController,
          child: Form(
            key: _formKey, // Associate the key with the form
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: const Text(
                    "Create New Account",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: baseColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Already Registered? Log in here.",
                    style: TextStyle(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: "NAME",
                      hintText: "Enter name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: "EMAIL",
                      hintText: "hello@example.com",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                          .hasMatch(value)) {
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "PASSWORD",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: TextFormField(
                    controller: _dobController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: "DATE OF BIRTH",
                      hintText: "DD/MM/YYYY",
                      border: OutlineInputBorder(),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );

                      if (pickedDate != null) {
                        String formattedDate =
                            "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
                        _dobController.text = formattedDate;
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Date of Birth is required";
                      }
                      if (!RegExp(r"^\d{2}/\d{2}/\d{4}$").hasMatch(value)) {
                        return "Enter a valid date in DD/MM/YYYY format";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: TextFormField(
                    controller: _referralCodeController,
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: "REFERRAL CODE (IF ANY)",
                      hintText: "HEA019382",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ScaleTransition(
                  scale: _animationController.drive(
                    Tween(begin: 0.8, end: 1.0).chain(
                      CurveTween(curve: Curves.elasticOut),
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: baseColor,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("Name: ${_nameController.text}");
                        print("Email: ${_emailController.text}");
                        print("Password: ${_passwordController.text}");
                        print("Date of Birth: ${_dobController.text}");
                        print("Referral Code: ${_referralCodeController.text}");
                      } else {
                        print("Validation failed");
                      }
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontSize: 18, color: whiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
