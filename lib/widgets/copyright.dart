import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  const Copyright({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0XFF242830)
      ),
      child: Center(
        child: Text(
          "Copyright 2021 Pranjal Rane. All Rights Reserved.",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      )
    );
  }
}