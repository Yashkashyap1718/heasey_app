import 'package:flutter/material.dart';
import 'package:heasey_app/utils/constant/color_const.dart';
import 'package:heasey_app/view/ProductDescription_view.dart';
import 'package:heasey_app/view/about_view.dart';
import 'package:heasey_app/view/home_view.dart';
import 'package:heasey_app/view/login_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heasey_app/view/profile/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: baseColor),
          useMaterial3: true,
          fontFamily: GoogleFonts.lato().fontFamily),
      home: const HomePage(),
    );
  }
}
