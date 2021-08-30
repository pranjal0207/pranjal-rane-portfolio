import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pranjal_rane_portfolio/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme),
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}