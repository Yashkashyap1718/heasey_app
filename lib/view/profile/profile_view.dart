import 'package:flutter/material.dart';
import 'package:heasey_app/utils/constant/color_const.dart';
import 'package:heasey_app/view/profile/in%20profile/CertificationsScreen.dart';
import 'package:heasey_app/view/profile/in%20profile/MyAccountScreen.dart';
import 'package:heasey_app/view/profile/in%20profile/MyIncomeScreen.dart';
import 'package:heasey_app/view/profile/in%20profile/MyOrdersScreen.dart';
import 'package:heasey_app/view/profile/in%20profile/MyReferralsScreen.dart';
import 'package:heasey_app/view/profile/in%20profile/RaiseTicketScreen.dart';
import 'package:heasey_app/view/profile/in%20profile/RewardsScreen.dart';
import 'package:heasey_app/view/profile/in%20profile/TermsPoliciesScreen.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      const MyAccountScreen(),
      const MyOrdersScreen(),
      const MyReferralsScreen(),
      const MyIncomeScreen(),
      const RewardsScreen(),
      const RaiseTicketScreen(),
      const CertificationsScreen(),
      const TermsPoliciesScreen(),
    ];
    final options = [
      "MY ACCOUNT (CONDITIONAL)",
      "MY ORDERS",
      "MY REFERRALS (CONDITIONAL)",
      "MY INCOME",
      "REWARDS",
      "RAISE A TICKET",
      "OUR CERTIFICATIONS",
      "HEASEY TERMS & POLICIES",
    ];
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background for better contrast
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "HI, USER",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
            letterSpacing: 1.2,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        if (options[index] == "RAISE A TICKET") {
                          _showRaiseTicketDialog(context); // Show dialog
                        } else {
                          // Navigate to the respective screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => screens[index]),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffFDD673),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              options[index],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios,
                                color: Colors.black, size: 18),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context); // Go back
                },
                backgroundColor: Colors.indigo,
                child: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRaiseTicketDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Center(
            child: Text(
              "Raise a Ticket",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Your ticket has been successfully raised!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/google.png', // Replace with your asset image
                height: 80,
                width: 80,
              ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
                child: const Text(
                  "OK",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
