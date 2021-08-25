import 'package:flutter/material.dart';

class TitleName extends StatelessWidget {
  const TitleName({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "PRANJAL RANE",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}