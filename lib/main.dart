import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pranjal_rane_portfolio/landingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pranjal Rane',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: LandingPage(),
    );
  }
}