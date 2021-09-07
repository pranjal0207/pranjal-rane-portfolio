import 'package:flutter/material.dart';

class TitleName extends StatelessWidget {
  const TitleName({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: SelectableText(
        "Pranjal Rane",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      )
    );
  }
}